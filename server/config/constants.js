const constants = Object.freeze({
  // 更多状态码请看 https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/200
  HTTP_CODE: {
    OK: 200,
    BAD_REQUEST: 400,
    UNAUTHORIZED: 401,
    FORBIDDEN: 403,
    NOT_FOUND: 404,
    INTERNAL_SERVER_ERROR: 500,
    SERVICE_BUSY: 503,
  },
  CUSTOM_CODE: {
    SOME_CUSTOM_ERROR: 1001,
    OK: 2000,
    PARAM_VALIDATION_FAILED: 4001,
    USER_NOT_FOUND: 4004,
  },
})

module.exports = constants
