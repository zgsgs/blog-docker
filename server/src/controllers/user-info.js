const Router = require('koa-router')
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
