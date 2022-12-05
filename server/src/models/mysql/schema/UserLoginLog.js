const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const UserLoginLog = sequelize.define('UserLoginLog', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.STRING, allowNull: false, comment: '状态' },
  uid: { type: DataTypes.INTEGER, allowNull: false, comment: '用户ID' },
  browser: { type: DataTypes.STRING, allowNull: false, comment: '登录浏览器' },
  resolution: { type: DataTypes.STRING, allowNull: false, comment: '登录屏幕分辨率' },
  ip: { type: DataTypes.STRING, allowNull: false, comment: '登录IP' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = UserLoginLog
