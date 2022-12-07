const { HTTP_CODE } = require('@config/constants')
const log4js = require('./logger/log4js')
const { CustomError, HttpError } = require('@/utils/error')

module.exports = (options) => {
  const loggerMiddleware = log4js(options)

  return async (ctx, next) => {
    return loggerMiddleware(ctx, next).catch((err) => {
      if (err instanceof CustomError || err instanceof HttpError) {
        const { code, msg, data } = err.getCodeMsg()
        ctx.status = err instanceof HttpError ? code : HTTP_CODE.OK
        ctx.success({ code, msg, data })
      }
      else {
        ctx.status = HTTP_CODE.INTERNAL_SERVER_ERROR
        console.error('err', err)
        ctx.log.error(JSON.stringify(err))
        ctx.throw(err)
      }
    })
  }
}
