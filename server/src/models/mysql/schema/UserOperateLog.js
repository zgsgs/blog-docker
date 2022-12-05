const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const UserOperateLog = sequelize.define('UserOperateLog', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.STRING, allowNull: false, comment: '状态' },
  uid: { type: DataTypes.INTEGER, allowNull: false, comment: '用户ID' },
  type: { type: DataTypes.STRING, allowNull: false, comment: '操作类型(如增删改查,可放到字典表)' },
  module: { type: DataTypes.STRING, allowNull: false, comment: '操作模块(关联的是菜单表编号)' },
  content: { type: DataTypes.STRING, allowNull: false, comment: '操作内容(越具体越好,比如:修改前后)' },
  ip: { type: DataTypes.STRING, allowNull: false, comment: '操作IP' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = UserOperateLog
