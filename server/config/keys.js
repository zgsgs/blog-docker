require('dotenv').config()

module.exports = Object.freeze({
  secretOrKey: 'jasonZgs',
  mongo: {
    URI: `mongodb://${process.env.MONGO_USER}:${process.env.MONGO_PWD}@${process.env.MONGO_IP}:${process.env.MONGO_PORT}/${process.env.MONGO_DB}`,
  },
  redis:{
    host:'127.0.0.1',
    port:'6379',
    password:''
  },
  upload:{
    dir:'public/upload/',
    maxFieldsSize: 2 * 1024 * 1024, // 文件上传大小
  },
})
