const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')
// const AuthRole = require('./AuthRole')
// const User = require('./User')

const UserRole = sequelize.define('UserRole', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.STRING, allowNull: false, comment: '状态' },
  uid: { type: DataTypes.INTEGER, allowNull: false, comment: '用户ID' },
  role_id: { type: DataTypes.INTEGER, allowNull: false, comment: '角色ID' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

// User.belongsToMany(AuthRole, { through: UserRole })
// AuthRole.belongsToMany(User, { through: UserRole })

module.exports = UserRole
