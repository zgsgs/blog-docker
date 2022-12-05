const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const UserExperience = sequelize.define('UserExperience', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.INTEGER, allowNull: false, comment: '状态 0-未启用', defaultValue: 0 },
  uid: { type: DataTypes.INTEGER, allowNull: false, comment: '用户ID' },
  current: { type: DataTypes.BOOLEAN, comment: '当前工作状态' },
  title: { type: DataTypes.STRING, comment: '名称' },
  company: { type: DataTypes.STRING, comment: '公司' },
  location: { type: DataTypes.STRING, comment: '公司地址' },
  from: { type: DataTypes.DATE, comment: '入职时间' },
  to: { type: DataTypes.DATE, comment: '离职时间' },
  description: { type: DataTypes.STRING, comment: '工作描述' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = UserExperience
