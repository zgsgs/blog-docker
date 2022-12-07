const fs = require('fs')
const path = require('path')
const Router = require('koa-router')
const router = new Router({ prefix: '/api/v1' })

// 自动加载注册路由
const files = fs.readdirSync(path.join(__dirname, '../controllers'))
for (const file of files) {
  const fileExtension = file.substring(file.lastIndexOf('.') + 1)
  if (fileExtension !== 'js')
    continue

  const fileName = file.replace(/(.*\/)*([^.]+).*/ig, '$2')
  const url = fileName.replace('-', '/')
  router.use(`/${url}`, require(`@api/${fileName}`))
}

module.exports = router
