const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const SystemApiLog = sequelize.define('SystemApiLog', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.INTEGER, allowNull: false, comment: '状态 0-未启用', defaultValue: 0 },
  uid: { type: DataTypes.INTEGER, allowNull: false, comment: '用户ID' },
  method: { type: DataTypes.ENUM('post', 'get', 'delete', 'put', 'head', 'connect', 'options', 'trace', 'patch'), allowNull: false, comment: '请求类型' },
  module: { type: DataTypes.STRING, allowNull: false, comment: '模块(菜单ID)' },
  controller: { type: DataTypes.STRING, allowNull: false, comment: '控制器' },
  action: { type: DataTypes.STRING, allowNull: false, comment: '方法' },
  url: { type: DataTypes.STRING, allowNull: false, comment: '请求URL' },
  get_data: { type: DataTypes.TEXT, comment: 'get参数' },
  post_data: { type: DataTypes.TEXT, comment: 'post参数' },
  error_code: { type: DataTypes.INTEGER, comment: '状态码' },
  error_msg: { type: DataTypes.STRING, comment: '报错信息' },
  error_data: { type: DataTypes.TEXT, comment: '报错日志' },
  req_id: { type: DataTypes.STRING, comment: '对外IP' },
  ip: { type: DataTypes.STRING, comment: 'IP地址' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = SystemApiLog
