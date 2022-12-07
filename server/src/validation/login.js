const Validator = require('validator')
const isEmpty = require('./is-empty')

/**
 * @desc: 登录表单验证
 * @access: public
 * @param {Object} validateLoginInput
 * @return {Object} isValid
 */
const validateLoginInput = (data) => {
  const errors = {}
  let { phone, email, password } = data
  phone = !isEmpty(phone) ? phone : ''
  email = !isEmpty(email) ? email : ''
  password = !isEmpty(password) ? password : ''

  phone && !Validator.isMobilePhone(phone) && (errors.phone = '手机号不合法')
  phone && Validator.isEmpty(phone) && (errors.phone = '手机号不能为空')
  email && !Validator.isEmail(email) && (errors.email = '邮箱不合法')
  email && Validator.isEmpty(email) && (errors.email = '邮箱不能为空')
  !Validator.isLength(password, { min: 6, max: 30 }) && (errors.password = 'password的长度不能小于6位且不超过30位')
  Validator.isEmpty(password) && (errors.password = 'password不能为空')

  return {
    errors,
    isValid: isEmpty(errors),
  }
}

module.exports = validateLoginInput
