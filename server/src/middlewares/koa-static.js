const path = require('path')
const serve = require('koa-static')

module.exports = () => {
  return serve(path.join(__dirname, '@/public'))
}
