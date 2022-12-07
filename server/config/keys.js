require('dotenv').config()

const keys = Object.freeze({
  secretOrKey: 'Jason Up', // jwt 密钥key
  accessExpire: 7200, // 过期时间2小时
  refreshExpire: 604800, // 过期时间7天 7200 * 12 * 7
  mongo: {
    URI: `mongodb://${process.env.MONGO_USER}:${process.env.MONGO_PWD}@${process.env.MONGO_IP}:${process.env.MONGO_PORT}/${process.env.MONGO_DB}`,
  },
  redis: {
    host: '127.0.0.1',
    port: '6379',
    password: '',
  },
  upload: {
    dir: 'public/upload/',
    maxFieldsSize: 2 * 1024 * 1024, // 文件上传大小
  },
})

module.exports = keys
