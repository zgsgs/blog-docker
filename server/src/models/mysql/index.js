require('colors')
require('dotenv').config()
const Sequelize = require('sequelize')
const fs = require('fs')
const path = require('path')

const sequelize = new Sequelize(process.env.MYSQL_DB, process.env.MYSQL_USER, process.env.MYSQL_PWD, {
  host: process.env.MYSQL_IP, // 数据库地址
  dialect: 'mysql', // 指定连接的数据库类型
  pool: {
    max: 5, // 连接池最大连接数量
    min: 0, // 最小连接数量
    idle: 10000, // 如果一个线程 10秒没有被使用过的话，就释放
  },
  dialectOptions: {
    charset: 'utf8mb4',
  },
  define: {
    timestamps: false,
    underscored: true,
    charset: 'utf8mb4',
  },
  logging: (...msg) => console.log(msg), // 使用自定义记录器,显示第一个参数
})

sequelize
  .authenticate()
  .then(r => {
    // 加载mysql模型
    const files = fs.readdirSync(path.join(__dirname, 'schema'))
    try {
      for (let file of files) {
        const fileExtension = file.substring(file.lastIndexOf('.') + 1)
        if (fileExtension !== 'js') {
          continue
        }
        const fileName = file.replace(/(.*\/)*([^.]+).*/gi, '$2')
        require(`./schema/${fileName}`)
      }
    } catch (error) {
      console.log(error)
    }

    // 同步模型到数据库
    // .sync()-如果表不存在，则会创建表（如果已经存在，则不执行任何操作）
    // .sync({ force: true }) -这将创建表，如果该表已经存在，则将其首先删除
    // .sync({ alter: true }) -这将检查数据库中表的当前状态（它具有哪些列，它们的数据类型是什么，等等），然后在表中进行必要的更改以使其与模型匹配
    // sequelize
    //   .sync({ force: true })
    //   .then(() => {
    //     console.log(`${'sync'.green}: OK`)
    //     process.exit()
    //   })
    //   .catch(r => {
    //     throw new Error(`${'sync'.red}: MySQL sync fail 😂`.red, r)
    //   })

    console.log(`${'debug'.green}: MySQL connected success ❤️`.blue)
  })
  .catch(r => {
    throw new Error(`${'debug'.red}: MySQL connected fail 😂`.red, r)
  })

module.exports = sequelize
