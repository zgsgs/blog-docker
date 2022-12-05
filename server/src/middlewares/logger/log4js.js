const log4js = require('log4js')
const ip = require('ip')
const moment = require('moment')

const methods = ['trace', 'debug', 'info', 'warn', 'error', 'fatal', 'mark']

// 提取默认公用参数对象
const baseInfo = {
  appLogLevel: 'debug', // 指定记录的日志级别
  dir: 'logs', // 指定日志存放的目录名
  env: 'dev', // 指定当前环境，当为开发环境时，在控制台也输出，方便调试
  projectName: 'koa2-restful-api', // 项目名，记录在日志中的项目信息
  serverIp: '0.0.0.0', // 默认情况下服务器 ip 地址
}

const Logger = options => {
  const logger = log4js.getLogger('cheese')
  const contextLogger = {}
  const appenders = {}
  // 合并配置
  const opts = Object.assign({}, baseInfo, options || {})
  // 需要的变量解构 方便使用
  const { env, appLogLevel, dir, serverIp, projectName } = opts

  // 环境变量为dev local development 认为是开发环境
  if (env === 'dev' || env === 'local' || env === 'development') {
    appenders.out = {
      type: 'console',
    }
  }
  appenders.cheese = {
    type: 'dateFile',
    encoding: 'utf-8',
    filename: `${dir}/task`,
    layout: {
      type: 'pattern',
      pattern: '{"date":"%d","level":"%p","data":\'%m\'}',
    },
    pattern: '-yyyy-MM-dd.log',
    alwaysIncludePattern: true,
  }
  let config = {
    appenders,
    categories: {
      default: {
        appenders: Object.keys(appenders),
        level: appLogLevel,
      },
    },
  }

  // 挂载日志方法
  methods.forEach(method => {
    contextLogger[method] = message => {
      logger[method](message)
    }
  })

  // 配置 log4js
  log4js.configure(config)

  return async (ctx, next) => {
    const start = Date.now()

    // 丰富日志信息
    const { method, url, host, headers } = ctx.request
    const bodyParams = ctx.req.body || ctx.request.body
    // serverIp ip 二选一
    const ip = ctx.request.get('X-Forwarded-For') || ctx.request.get('X-Real-IP')
    let client = {
      method,
      url,
      host,
      serverIp,
      ip,
      projectName,
      referer: headers['referer'],
      userAgent: headers['user-agent'],
      body: bodyParams ? JSON.stringify(bodyParams) : '',
      time: moment().format('YYYY-MM-DD HH:mm:ss'),
    }

    client = JSON.stringify(client)
    // 为 ctx 增加 log 方法
    Object.defineProperty(ctx, 'log', {
      value: contextLogger,
      writable: false,
      enumerable: true,
      configurable: false,
    })
    // 为 global 增加 log 方法，并且指定 log 属性不可删除或修改 防止后续错误修改 global 属性
    Object.defineProperty(global, 'log', {
      value: contextLogger,
      writable: false,
      enumerable: true,
      configurable: false,
    })
    await next()
    // 检测响应时间
    const responseTime = Date.now() - start
    logger.info(`响应时间为${responseTime / 1000}s, 请求相关信息: ${client}`)
  }
}

module.exports = () => {
  return Logger({
    env: process.env.NODE_ENV,
    projectName: 'koa2&log4js',
    appLogLevel: 'info',
    dir: 'logs',
    serverIp: ip.address(),
  })
}
