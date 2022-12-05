const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const AuthMenu = sequelize.define('AuthMenu', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.INTEGER, allowNull: false, comment: '状态 0-未启用', defaultValue: 0 },
  name: { type: DataTypes.STRING, allowNull: false, comment: '菜单名' },
  code: { type: DataTypes.STRING, allowNull: false, comment: '菜单代码' },
  pid: { type: DataTypes.STRING, comment: '父节点ID' },
  type: { type: DataTypes.STRING, allowNull: false, comment: '节点类型 1文件夹 2页面 3按钮' },
  icon: { type: DataTypes.STRING, comment: 'icon地址' },
  sort: { type: DataTypes.INTEGER, allowNull: false, comment: '排序号', defaultValue: 9999 },
  link: { type: DataTypes.STRING, comment: '页面地址' },
  level: { type: DataTypes.STRING, allowNull: false, comment: '等级' },
  path: { type: DataTypes.STRING, comment: '树ID的路径 从根节点到当前树的父节点的路径 逗号分隔' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = AuthMenu
