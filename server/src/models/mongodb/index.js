// DB库
const MongoDB = require('mongodb')
const MongoClient = MongoDB.MongoClient
const ObjectID = MongoDB.ObjectID

const Config = {
  dbUrl: `mongodb://${process.env.MONGO_USER}:${process.env.MONGO_PWD}@${process.env.MONGO_IP}:${process.env.MONGO_PORT}/${process.env.MONGO_DB}`,
  dbName: process.env.MONGO_DB,
}

class Db {
  static getInstance() { /* 1、单例  多次实例化实例不共享的问题 */
    if (!Db.instance)
      Db.instance = new Db()

    return Db.instance
  }

  constructor() {
    this.dbClient = '' /* 属性 放db对象 */
    this.connect() /* 实例化的时候就连接数据库 */
  }

  connect() { /* 连接数据库 */
    const _that = this
    return new Promise((resolve, reject) => {
      if (!_that.dbClient) { /* 1、解决数据库多次连接的问题 */
        MongoClient.connect(Config.dbUrl, { useNewUrlParser: true }, (err, client) => {
          if (err) {
            reject(err)
          }
          else {
            _that.dbClient = client.db(Config.dbName)
            resolve(_that.dbClient)
          }
        })
      }
      else {
        resolve(_that.dbClient)
      }
    })
  }

  /**
   * DB.find('user',{}) 返回所有数据
   * DB.find('user',{},{"title":1}) 返回所有数据  只返回一列
   * DB.find('user',{},{"title":1},{ page:2, pageSize:20, sort:{"add_time":-1} }) 返回第二页的数据
   * js中实参和形参可以不一样
   * arguments 对象接收实参传过来的数据
   */
  find(collectionName, json1, json2, json3) {
    let attr = {}
    let slipNum = 0
    let pageSize = 0
    let page = 1
    let sortJson = {}

    if (arguments.length === 3) {
      attr = json2
    }
    else if (arguments.length === 4) {
      attr = json2
      page = parseInt(json3.page) || 1
      pageSize = parseInt(json3.pageSize) || 20
      slipNum = (page - 1) * pageSize
      sortJson = json3.sort ? json3.sort : {}
    }
    else {
      console.error('传入参数错误')
    }
    return new Promise((resolve, reject) => {
      this.connect().then((db) => {
        // 等价于 const result= db.user.find(json)
        const result = db.collection(collectionName).find(json1, { fields: attr }).skip(slipNum).limit(pageSize).sort(sortJson)
        result.toArray((err, docs) => {
          if (err) {
            reject(err)
            return
          }
          resolve(docs)
        })
      })
    })
  }

  update(collectionName, json1, json2) {
    return new Promise((resolve, reject) => {
      this.connect().then((db) => {
        // 等价于 db.user.update({},{$set:{}})
        db.collection(collectionName).updateOne(json1, {
          $set: json2,
        }, (err, result) => {
          if (err)
            reject(err)
          else
            resolve(result)
        })
      })
    })
  }

  insert(collectionName, json) {
    return new Promise((resolve, reject) => {
      this.connect().then((db) => {
        db.collection(collectionName).insertOne(json, (err, result) => {
          if (err)
            reject(err)
          else
            resolve(result)
        })
      })
    })
  }

  remove(collectionName, json) {
    return new Promise((resolve, reject) => {
      this.connect().then((db) => {
        db.collection(collectionName).removeOne(json, (err, result) => {
          if (err)
            reject(err)
          else
            resolve(result)
        })
      })
    })
  }

  // mongodb里面查询 _id 把字符串转换成对象
  getObjectId(id) {
    return new ObjectID(id)
  }

  // 统计数量的方法
  count(collectionName, json) {
    return new Promise((resolve, reject) => {
      this.connect().then((db) => {
        const result = db.collection(collectionName).count(json)
        result.then((count) => {
          resolve(count)
        },
        )
      })
    })
  }
}

module.exports = Db.getInstance()
