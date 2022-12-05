const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')
// const Auth = require('./Auth')
// const Blog = require('./Blog')
// const UserInfo = require('./UserInfo')
// const UserEducation = require('./UserEducation')
// const UserExperience = require('./UserExperience')
// const UserBehavior = require('./UserBehavior')
// const UserProperty = require('./UserProperty')
// const UserHistory = require('./UserHistory')
// const UserFocus = require('./UserFocus')
// const UserLoginLog = require('./UserLoginLog')
// const UserOperateLog = require('./UserOperateLog')

const User = sequelize.define('User', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.INTEGER, allowNull: false, comment: '状态 0-未启用', defaultValue: 0 },
  uuid: { type: DataTypes.STRING, allowNull: false, unique: true, comment: 'uuid用户唯一标识', defaultValue: DataTypes.UUIDV4 },
  code: { type: DataTypes.STRING, allowNull: false, comment: '账号代号' },
  type: { type: DataTypes.STRING, allowNull: false, comment: '账号类型 0-管理员 1-一般用户(注册但未认证) 2-会员(认证通过) 3-VIP(付费用户)' },
  level: { type: DataTypes.INTEGER, allowNull: false, comment: '账号等级', defaultValue: 0 },
  name: { type: DataTypes.STRING, allowNull: false, comment: '用户名' },
  phone: { type: DataTypes.STRING, allowNull: false, unique: true, comment: '手机号' },
  password: { type: DataTypes.STRING, allowNull: false, comment: '密码' },
  salt: { type: DataTypes.STRING, allowNull: false, comment: '密码盐值' },
  avatar: { type: DataTypes.STRING, comment: '头像' },
  last_login_ip: { type: DataTypes.STRING, allowNull: false, defaultValue: '0.0.0.0', validate: { isIP: true }, comment: '最后登录IP' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

// User.Auth = User.hasMany(Auth)
// User.Blog = User.hasMany(Blog)
// User.UserInfo = User.hasOne(UserInfo)
// User.UserEducation = User.hasMany(UserEducation)
// User.UserExperience = User.hasMany(UserExperience)
// User.UserFocus = User.hasMany(UserFocus)
// User.UserBehavior = User.hasMany(UserBehavior)
// User.UserProperty = User.hasMany(UserProperty)
// User.UserHistory = User.hasMany(UserHistory)
// User.UserLoginLog = User.hasMany(UserLoginLog)
// User.UserOperateLog = User.hasMany(UserOperateLog)

module.exports = User
