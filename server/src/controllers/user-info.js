const Router = require('koa-router')
const passport = require('koa-passport')
const fs = require('fs')
const path = require('path')
// import form validate
const validateRegisterInput = require('@/validation/register')
// import UserInfo
const UserInfo = require('@mysql/UserInfo')
const tools = require('@/utils/tools')
const { constants } = require('@root/config')
const { CustomError, HttpError } = require('@/utils/error')
const keys = require('@root/config/keys')

const router = new Router()

/**
 * @route GET api/users/test
 * @desc 测试接口地址
 * @access: public
 * @param {*}
 * @return {*}
 */
router.get('test', '/test', async (ctx, next) => {
  ctx.log.info('/test - ctx测试log4js')
  ctx.success({ msg: '测试路由' })
  await next()
})

router.get('testId', '/test/:id', async (ctx, next) => {
  ctx.log.info('/test/:id - ctx测试log4js')
  ctx.success({ msg: `匹配路由id = ${ctx.params.id}` })
})

module.exports = router.routes()
