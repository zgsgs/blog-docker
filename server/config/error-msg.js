const errorMsg = Object.freeze({
  200: 'ok',
  400: 'Invalid param',
  401: 'Unauthorized',
  403: 'Forbidden',
  404: 'Not found',
  500: 'Internal server error',
  503: 'Service busy',
  1001: 'Some custom error msg',
  4001: 'Parameter verification failed',
})

module.exports = errorMsg
