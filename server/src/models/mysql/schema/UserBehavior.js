const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const UserBehavior = sequelize.define('UserBehavior', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.STRING, allowNull: false, comment: '状态 0-未启用', defaultValue: 0 },
  uid: { type: DataTypes.INTEGER, allowNull: false, comment: '用户ID' },
  object_type: { type: DataTypes.STRING, allowNull: false, comment: '关联对象类型' },
  object_id: { type: DataTypes.STRING, allowNull: false, comment: '关联对象号' },
  type: { type: DataTypes.STRING, allowNull: false, comment: '行为类型' },
  value: { type: DataTypes.STRING, allowNull: false, comment: '行为数值' },
  intro: { type: DataTypes.STRING, comment: '行为说明' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = UserBehavior
