const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const SystemLog = sequelize.define('SystemLog', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.INTEGER, allowNull: false, comment: '状态 0-未启用', defaultValue: 0 },
  tag: { type: DataTypes.ENUM('unknow', 'login', 'info', 'admin', 'cron', 'manual'), allowNull: false, comment: '日志标签' },
  level: { type: DataTypes.ENUM('info', 'warning', 'error', 'critical', 'exception', 'debug'), allowNull: false, comment: '日志等级' },
  type: { type: DataTypes.INTEGER, allowNull: false, comment: '日志类型 0-系统日志 1-用户日志' },
  message: { type: DataTypes.INTEGER, allowNull: false, comment: '日志内容' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = SystemLog
