module.exports = (option = {
  type: 'json',
  successCode: 2000,
  successMsg: 'ok',
  failCode: -1,
  failMsg: 'fail',
}) => {
  return async (ctx, next) => {
    ctx.success = function (opt = {}) {
      ctx.type = opt.type || option.type
      ctx.body = {
        code: opt.code || option.successCode,
        msg: opt.msg || option.successMsg,
        data: opt.data,
      }
    }
    ctx.fail = function (opt = {}) {
      ctx.type = opt.type || option.type
      ctx.body = {
        code: opt.code || option.failCode,
        msg: opt.msg || option.successMsg,
        data: null,
      }
    }
    await next()
  }
}
