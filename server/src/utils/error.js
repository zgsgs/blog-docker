const util = require('util')
const { errorMsg } = require('@root/config')
const { HTTP_CODE } = require('@config/constants')

/**
 * @desc: 自定义错误处理
 * @access: public
 * @param {*} code 错误状态码
 * @param {*} msg 错误消息
 * @return {*}
 */
function CustomError(code, msg, data = {}) {
  Error.call(this, '')

  this.code = code
  this.msg = msg || errorMsg[code] || 'Unknown error'
  this.data = data

  this.getCodeMsg = function () {
    return {
      code: this.code,
      msg: this.msg,
      data: this.data,
    }
  }
}
/**
 * @desc: http协议请求错误处理
 * @access: public
 * @param {*} code 错误状态码
 * @param {*} msg 错误消息
 * @return {*}
 */
function HttpError(code, msg) {
  if (Object.values(HTTP_CODE).indexOf(code) < 0) {
    throw Error('Not an invalid http code')
  }

  CustomError.call(this, code, msg)
}

util.inherits(CustomError, Error)
util.inherits(HttpError, CustomError)

module.exports = { HttpError, CustomError }
