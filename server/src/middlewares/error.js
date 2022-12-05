const { CustomError, HttpError } = require('@/utils/error')
const { formatResponse } = require('@/utils/tools')
const log4js = require('./logger/log4js')

module.exports = options => {
  const loggerMiddleware = log4js(options)

  return async (ctx, next) => {
    return loggerMiddleware(ctx, next).catch(err => {
      let code = 500
      let msg = 'Unknown error'
      let data = {}

      if (err instanceof CustomError || err instanceof HttpError) {
        const res = err.getCodeMsg()
        ctx.status = err instanceof HttpError ? res.code : 200
        code = res.code
        msg = res.msg
        data = res.data
      } else {
        ctx.status = code
        console.error('err', err)
        ctx.log.error(JSON.stringify(err))
        ctx.throw(err)
      }
      ctx.body = formatResponse(code, msg, data)
    })
  }
}
