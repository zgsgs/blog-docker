const Router = require('koa-router')

const router = new Router()

/**
 * @route POST /test
 * @desc: 路由重定向
 * @access: public
 * @param {*}
 * @return {*}
 */
 router.get('/test', async ctx => {
  ctx.log.info('/test - ctx测试log4js')
  ctx.success({ msg: 'root router test works...' })
})

/**
 * @route POST /redirect
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

// router.all('/*', async (ctx, next) => {
//   ctx.set('Access-Control-Allow-Origin', 'http://baidu.com')
//   await next()
// })
/**
 * @route POST /redirect
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

// router.all('/*', async (ctx, next) => {
//   ctx.set('Access-Control-Allow-Origin', 'http://baidu.com')
//   await next()
// })

module.exports = router.routes()
