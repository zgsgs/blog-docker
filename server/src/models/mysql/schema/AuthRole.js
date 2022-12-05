const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const AuthRole = sequelize.define('AuthRole', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.INTEGER, allowNull: false, comment: '状态 0-未启用', defaultValue: 0 },
  code: { type: DataTypes.STRING, allowNull: false, comment: '角色代码' },
  sort: { type: DataTypes.STRING, allowNull: false, comment: '排序代码', defaultValue: 9999 },
  name: { type: DataTypes.STRING, allowNull: false, comment: '角色名' },
  type: { type: DataTypes.STRING, allowNull: false, comment: '角色类型' },
  summary: { type: DataTypes.STRING, comment: '角色描述' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = AuthRole
