const Validator = require('validator')
const isEmpty = require('./is-empty')

module.exports = validateRegisterInput = data => {
  let errors = {}
  let { name, phone, email, password, password2 } = data
  const flag = {
    name: !isEmpty(name),
    phone: !isEmpty(phone),
    password: !isEmpty(password),
    password2: !isEmpty(password2),
  }
  name = flag.name ? name.trim() : ''
  phone = flag.phone ? phone : ''
  password = flag.password ? password : ''
  password2 = flag.password2 ? password2 : ''

  flag.name && !Validator.isLength(name, { min: 2, max: 30 }) && (errors.name = '名字的长度不能小于2位且不超过30位')
  !Validator.isMobilePhone(phone) && (errors.phone = '邮箱不合法')
  flag.email && !Validator.isEmail(email) && (errors.email = '邮箱不合法')
  flag.password2 && !Validator.equals(password, password2) && (errors.password2 = '两次密码不一致')
  !Validator.isLength(password, { min: 6, max: 30 }) && (errors.password = 'password的长度不能小于6位且不超过30位')
  flag.password2 && !Validator.isLength(password2, { min: 6, max: 30 }) && (errors.password2 = 'password2的长度不能小于6位且不超过30位')
  // Validator.isEmpty(name) && (errors.name = '名字不能为空')
  Validator.isEmpty(phone) && (errors.phone = '手机号不能为空')
  // Validator.isEmpty(email) && (errors.email = '邮箱不能为空')
  Validator.isEmpty(password) && (errors.password = 'password不能为空')
  flag.password2 && Validator.isEmpty(password2) && (errors.password2 = 'password2不能为空')

  return {
    errors,
    isValid: isEmpty(errors),
  }
}
