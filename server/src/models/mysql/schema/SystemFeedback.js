const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const SystemFeedback = sequelize.define('SystemFeedback', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.STRING, allowNull: false, comment: '状态' },
  level: { type: DataTypes.STRING, allowNull: false, comment: '反馈层级' },
  pid: { type: DataTypes.INTEGER, allowNull: false, comment: '被回复反馈ID 0-仅为反馈', defaultValue: 0 },
  type: { type: DataTypes.STRING, allowNull: false, comment: '反馈类型' },
  title: { type: DataTypes.STRING, allowNull: false, comment: '反馈标题' },
  content: { type: DataTypes.TEXT, allowNull: false, comment: '反馈内容' },
  ip: { type: DataTypes.STRING, allowNull: false, defaultValue: '', validate: { isIP: true }, comment: '反馈IP' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = SystemFeedback
