/**
 * @desc: 判断空
 * @access: public
 * @param {Any} value
 * @return {Boolean} isEmpty
 */
const isEmpty = (value) => {
  return value === undefined || value === null || (typeof value === 'object' && Object.keys(value).length === 0) || (typeof value === 'string' && value.trim().length === 0)
}

module.exports = isEmpty
