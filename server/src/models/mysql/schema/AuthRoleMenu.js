const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')
// const AuthMenu = require('./AuthMenu')
// const AuthRole = require('./AuthRole')

const AuthRoleMenu = sequelize.define('AuthRoleMenu', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.STRING, allowNull: false, comment: '状态' },
  role_id: { type: DataTypes.INTEGER, allowNull: false, comment: '角色ID' },
  menu_id: { type: DataTypes.INTEGER, allowNull: false, comment: '菜单ID' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

// AuthRole.belongsToMany(AuthMenu, { through: AuthRoleMenu })
// AuthMenu.belongsToMany(AuthRole, { through: AuthRoleMenu })

module.exports = AuthRoleMenu
