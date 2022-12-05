const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')

const SystemDictionary = sequelize.define('SystemDictionary', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, comment: '流水号', autoIncrement: true },
  status: { type: DataTypes.STRING, allowNull: false, comment: '状态' },
  type_id: { type: DataTypes.STRING, allowNull: false, comment: '字典类型ID' },
  code: { type: DataTypes.STRING, comment: '字典编码' },
  name: { type: DataTypes.STRING, comment: '字典中文名称' },
  remark: { type: DataTypes.STRING, comment: '字典备注' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

module.exports = SystemDictionary
