const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const Message = sequelize.define('Message', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.INTEGER, allowNull: false, comment: '状态 0-未启用', defaultValue: 0 },
  pid: { type: DataTypes.INTEGER, allowNull: false, comment: '被回复消息ID 0-仅为消息', defaultValue: 0 },
  level: { type: DataTypes.STRING, allowNull: false, comment: '消息等级' },
  type: { type: DataTypes.STRING, allowNull: false, comment: '消息类型 0-系统 1-用户 2-其他' },
  range: { type: DataTypes.STRING, allowNull: false, comment: '消息范围 0-全平台 x,x-指定用户ID' },
  title: { type: DataTypes.STRING, allowNull: false, comment: '消息标题' },
  content: { type: DataTypes.TEXT, allowNull: false, comment: '消息内容' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = Message
