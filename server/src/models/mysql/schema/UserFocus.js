const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const UserFocus = sequelize.define('UserFocus', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.INTEGER, allowNull: false, comment: '状态 0-未启用', defaultValue: 0 },
  uid: { type: DataTypes.INTEGER, allowNull: false, comment: '用户ID' },
  focus_id: { type: DataTypes.INTEGER, allowNull: false, comment: '关注人ID' },
  type: { type: DataTypes.INTEGER, allowNull: false, comment: '关注类型 0-一般关注 1-特别关注', defaultValue: 0 },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = UserFocus
