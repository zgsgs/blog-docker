const { DataTypes } = require('sequelize')
const sequelize = require('@models/mysql')
// const BlogCategory = require('./BlogCategory')
// const BlogComment = require('./BlogComment')

const Blog = sequelize.define('Blog', {
  id: { type: DataTypes.INTEGER, primaryKey: true, allowNull: false, unique: true, autoIncrement: true, comment: '流水号' },
  status: { type: DataTypes.INTEGER, allowNull: false, comment: '状态 0-未启用', defaultValue: 0 },
  uid: { type: DataTypes.INTEGER, allowNull: false, comment: '用户ID' },
  category_id: { type: DataTypes.INTEGER, allowNull: false, comment: '分类ID' },
  views: { type: DataTypes.STRING, allowNull: false, comment: '浏览量', defaultValue: 0 },
  collection: { type: DataTypes.INTEGER, allowNull: false, comment: '收藏量', defaultValue: 0 },
  title: { type: DataTypes.STRING, allowNull: false, comment: '标题' },
  label: { type: DataTypes.STRING, allowNull: false, comment: '标签' },
  topic: { type: DataTypes.STRING, allowNull: false, comment: '收录专栏' },
  cover: { type: DataTypes.STRING, allowNull: false, comment: '封面URL' },
  summary: { type: DataTypes.STRING, comment: '摘要', defaultValue: '' },
  content: { type: DataTypes.TEXT, comment: '内容' },
  is_delete: { type: DataTypes.INTEGER, comment: '软删除 1-已删除 0-未删除', defaultValue: 0 },
  revision: { type: DataTypes.STRING, comment: '乐观锁' },
  created_by: { type: DataTypes.STRING, comment: '创建人' },
  created_at: { type: DataTypes.DATE, comment: '创建时间', defaultValue: DataTypes.DATE },
  updated_by: { type: DataTypes.STRING, comment: '更新人' },
  updated_at: { type: DataTypes.DATE, comment: '更新时间', defaultValue: DataTypes.DATE },
})

// Blog.BlogCategory = Blog.hasOne(BlogCategory)
// Blog.BlogComment = Blog.hasMany(BlogComment)

module.exports = Blog
