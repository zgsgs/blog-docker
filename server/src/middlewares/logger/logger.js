const Logger = require('koa-logger')
const Moment = require('moment')

// 使用日志中间件
module.exports = () => {
  return Logger((str) => {
    // eslint-disable-next-line no-console
    console.log(`${Moment().format('YYYY-MM-DD HH:mm:ss')}${str}`)
  })
}
