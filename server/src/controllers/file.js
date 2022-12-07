const Router = require('koa-router')
const passport = require('koa-passport')
const { upload } = require('@/utils/file')

const router = new Router()

/**
 * @route POST api/auth/user/avatar
 * @desc: 上载图片
 * @access: private
 * @param {Context} ctx
 * @return {JSON}
 */
router.post('/file/images', passport.authenticate('jwt', { session: false }), async (ctx) => {
  const url = upload(ctx, { dirName: 'files' })
  ctx.success({ data: { url } })
})

module.exports = router.routes()
