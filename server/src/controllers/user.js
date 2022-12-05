const Router = require('koa-router')
const passport = require('koa-passport')
const fs = require('fs')
const path = require('path')
// import form validate
const validateRegisterInput = require('@/validation/register')
const validateLoginInput = require('@/validation/login')
// import User
const User = require('@mysql/User')
const { enbcrypt, compare, jwtSign, formatResponse } = require('@/utils/tools')
const { constants } = require('@root/config')
const { CustomError, HttpError } = require('@/utils/error')
const keys = require('@root/config/keys')

const router = new Router()

/**
 * @route GET api/auth/user/test
 * @desc 测试接口地址
 * @access: public
 * @param {*}
 * @return {*}
 */
router.get('/test', async ctx => {
  ctx.log.info('ctx测试log4js')
  ctx.body = { msg: 'auth-user works...' }
})

/**
 * @route POST api/auth/user/register
 * @desc: 注册 只允许手机号注册 其他字段为管理员添加账号使用
 * @access: public
 * @param {Context} ctx
 * @return {JSON}
 */
router.post('/register', async ctx => {
  const { errors, isValid } = validateRegisterInput(ctx.request.body)
  if (!isValid) {
    throw new CustomError(constants.CUSTOM_CODE.PARAM_VALIDATION_FAILED, null, errors)
  }
  let { phone, password, name, email, avatar, code } = ctx.request.body
  const findResult = await User.findAll({ where: { phone } })
  if (findResult.length > 0) {
    throw new CustomError(constants.CUSTOM_CODE.PARAM_VALIDATION_FAILED, null, { phone: '手机号已被占用' })
  }

  const { hash, salt } = await enbcrypt(password)
  if (!avatar) {
    avatar = `https://api.multiavatar.com/${name}.svg`
  }
  const uthUser = await User.build({
    name: name || phone.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2'),
    phone,
    password: hash,
    salt,
    email,
    avatar,
    code: code || 1, // 账号代号
    type: 1, // 1-一般用户(注册但未认证)
    created_at: new Date(),
    updated_at: new Date(),
  })
  // 存入数据库
  await uthUser
    .save()
    .then(user => {
      ctx.body = user
    })
    .catch(err => {
      ctx.body = err
    })
})

/**
 * @route POST api/auth/user/login
 * @desc: 登录
 * @access: public
 * @param {Context} ctx
 * @return {JSON}
 */
router.post('/login', async ctx => {
  ctx.log.info(ctx.request.body)
  const { errors, isValid } = validateLoginInput(ctx.request.body)
  if (!isValid) {
    throw new CustomError(constants.CUSTOM_CODE.PARAM_VALIDATION_FAILED, null, errors)
  }
  const { phone, email, password } = ctx.request.body
  const loginName = phone ? { phone } : { email }
  const findResult = await User.findAll(loginName)
  if (findResult.length == 0) {
    throw new CustomError(4004, '用户不存在')
  }
  const user = findResult[0]
  const { uuid, name, avatar, password: pwd } = user
  const payload = { uuid, name, avatar }
  const expire = 7200
  const access_token = jwtSign(payload, expire) // 过期时间2小时
  const refresh_token = jwtSign(payload, expire * 12 * 7) // 过期时间7天
  const isCompare = await compare(password, pwd)
  if (isCompare) {
    ctx.body = formatResponse(2000, 'ok', { uuid, expire, access_token, refresh_token })
  } else {
    throw new CustomError(constants.CUSTOM_CODE.PARAM_VALIDATION_FAILED, null, { password: '密码错误' })
  }
})
/**
 * @route POST api/auth/user/redirect
 * @desc: 路由重定向
 * @access: public
 * @param {*}
 * @return {*}
 */
router.get('/redirect', async ctx => {
  ctx.status = 304
  ctx.response.redirect('/')
  ctx.response.body = '<a href="/">Redirect Page</a>'
})
/**
 * @route POST api/auth/user/current
 * @desc: 跨表查询用户当前信息
 * @access: private
 * @param {Context} ctx
 * @return {JSON}
 */
router.get('/current', passport.authenticate('jwt', { session: false }), async ctx => {
  const { id, name, email, avatar } = ctx.state.user
  ctx.body = { id, name, email, avatar }
})
/**
 * @route POST api/auth/user/avatar
 * @desc: 上载头像
 * @access: private
 * @param {Context} ctx
 * @return {JSON}
 */
router.post('/avatar', passport.authenticate('jwt', { session: false }), async ctx => {
  const { id } = ctx.state.user
  const file = ctx.request.files.file
  const basename = path.basename(file.path)
  const reader = fs.createReadStream(file.path)
  const stream = fs.createWriteStream(path.join('../../public/images', file.name))
  reader.pipe(stream)
  ctx.log.info(`uploading ${file.name} -> ${stream.path}`)

  ctx.body = { url: `${ctx.origin}/${keys.upload.dir}${basename}` }
})

module.exports = router.routes()
