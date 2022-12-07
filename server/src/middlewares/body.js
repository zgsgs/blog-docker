const path = require('path')
const koaBody = require('koa-body')
const keys = require('@root/config/keys')

module.exports = () => {
  return koaBody({
    multipart: true, // 支持文件上传
    // encoding: 'gzip',
    formidable: {
      uploadDir: path.join(__dirname, '../../', keys.upload.dir), // 设置文件上传目录
      keepExtensions: true, // 保持文件的后缀
      maxFieldsSize: keys.upload.maxFieldsSize, // 文件上传大小
    },
  })
}
