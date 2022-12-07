const fs = require('fs')
const path = require('path')
const keys = require('@root/config/keys')

module.exports = {
  upload: (ctx, { dirName } = { dirName: 'images' }) => {
    const file = ctx.request.files.file
    const basename = path.basename(file.path)
    const reader = fs.createReadStream(file.path)
    const stream = fs.createWriteStream(path.join(`../../public/${dirName}`, file.name))
    reader.pipe(stream)
    ctx.log.info(`uploading ${file.name} -> ${stream.path}`)
    return `${ctx.origin}/${keys.upload.dir}${basename}`
  },
}
