const Router = require('koa-router')
const passport = require('koa-passport')
// import form validate
const Users = require('@mysql/Users')
const { CUSTOM_CODE } = require('@root/config/constants')
const keys = require('@root/config/keys')
const validateRegisterInput = require('@/validation/register')
const validateLoginInput = require('@/validation/login')
// import Users
const { enbcrypt, compare, jwtSign } = require('@/utils/jwt')
const { CustomError } = require('@/utils/error')
const { upload } = require('@/utils/file')

const router = new Router()

/**
 * @route GET api/auth/user/test
 * @desc 测试接口地址
 * @access: public
 * @param {*}
 * @return {*}
 */
router.get('/test', async (ctx) => {
  ctx.log.info('ctx测试log4js')
  ctx.success({ msg: 'auth-user works...' })
})

/**
 * @route POST api/auth/user/register
 * @desc: 注册 只允许手机号注册 其他字段为管理员添加账号使用
 * @access: public
 * @param {Context} ctx
 * @return {JSON}
 */
router.post('/register', async (ctx) => {
  const { errors, isValid } = validateRegisterInput(ctx.request.body)
  if (!isValid)
    throw new CustomError(CUSTOM_CODE.PARAM_VALIDATION_FAILED, null, errors)

  const { phone, password, name, email, code } = ctx.request.body
  let { avatar } = ctx.request.body
  const findResult = await Users.findAll({ where: { phone } })
  if (findResult.length > 0)
    throw new CustomError(CUSTOM_CODE.PARAM_VALIDATION_FAILED, null, { phone: '手机号已被占用' })

  const { hash, salt } = await enbcrypt(password)
  if (!avatar)
    avatar = `https://api.multiavatar.com/${name}.svg`

  const uthUser = await Users.build({
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
    .then((user) => {
      ctx.success({ data: user })
    })
    .catch((err) => {
      ctx.fail({ msg: err })
    })
})

/**
 * @route POST api/auth/user/login
 * @desc: 登录
 * @access: public
 * @param {Context} ctx
 * @return {JSON}
 */
router.post('/login', async (ctx) => {
  ctx.log.info(ctx.request.body)
  const { errors, isValid } = validateLoginInput(ctx.request.body)
  if (!isValid)
    throw new CustomError(CUSTOM_CODE.PARAM_VALIDATION_FAILED, null, errors)

  const { phone, password } = ctx.request.body
  const result = await Users.findOne({ where: { phone } })
  if (!result)
    throw new CustomError(CUSTOM_CODE.USER_NOT_FOUND)

  const { id, uuid, name, avatar, password: pwd } = result
  const payload = { id, uuid, name, avatar }
  const access_token = `Bearer ${jwtSign(payload, keys.accessExpire)}`
  const refresh_token = `Bearer ${jwtSign(payload, keys.refreshExpire)}`
  const isCompare = await compare(password, pwd)
  if (isCompare)
    ctx.success({ data: { id, expire: keys.accessExpire, access_token, refresh_token } })
  else
    throw new CustomError(CUSTOM_CODE.PARAM_VALIDATION_FAILED, null, { password: '密码错误' })
})

/**
 * @route POST api/auth/user/current
 * @desc: 跨表查询用户当前信息
 * @access: private
 * @param {Context} ctx
 * @return {JSON}
 */
router.get('/current', passport.authenticate('jwt', { session: false }), async (ctx) => {
  const { id, name, avatar } = ctx.state.user
  ctx.success({ data: { id, name, avatar } })
  // ctx.success({ data: ctx.state })
})
/**
 * @route POST api/auth/user/avatar
 * @desc: 上载头像
 * @access: private
 * @param {Context} ctx
 * @return {JSON}
 */
router.post('/avatar', passport.authenticate('jwt', { session: false }), async (ctx) => {
  const { id } = ctx.state.user
  const url = upload(ctx, { dirName: 'images' })
  // 路径写入用户表
  await Users.update({ avatar: url }, { where: { id } })
  const user = await Users.findOne({ where: { id } })

  ctx.success({ data: user })
})

module.exports = router.routes()
