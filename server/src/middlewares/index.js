const koaPassport = require('koa-passport')
const router = require('@/routes')
const error = require('./error')
const logger = require('./logger/logger')
const passport = require('./passport')
const static = require('./static')
const body = require('./body')
const cors = require('./cors')
const jsonResponse = require('./json-response')

module.exports = async app => {
  app.use(logger())
  app.use(error())
  app.use(static())
  app.use(body())
  app.use(cors())
  // 统一格式化输出
  app.use(jsonResponse())
  app.use(koaPassport.initialize())
  app.use(koaPassport.session())
  // Setup router
  app.use(router.routes()).use(router.allowedMethods())

  passport(koaPassport)

  // 全局监听error并生成logger
  app.on('error', async (err, ctx) => {
    console.error('Error occurred:', err)
  })
}