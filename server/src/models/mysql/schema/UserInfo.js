const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const UserInfo = sequelize.define('UserInfo', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.STRING, allowNull: false, comment: '状态' },
  uid: { type: DataTypes.INTEGER, allowNull: false, comment: '用户ID' },
  birthday: { type: DataTypes.DATE, comment: '生日' },
  location: { type: DataTypes.STRING, comment: '出生地址' },
  company: { type: DataTypes.STRING, comment: '公司' },
  post: { type: DataTypes.STRING, comment: '职位' },
  introduction: { type: DataTypes.STRING, comment: '个人介绍' },
  website: { type: DataTypes.STRING, comment: '个人站点' },
  skills: { type: DataTypes.STRING, comment: '技能' },
  bio: { type: DataTypes.STRING, comment: '个人签名' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = UserInfo
