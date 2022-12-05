# Log4js 封装

## 参考
[koa2 集成 log4js](http://shenyujie.cc/2018/05/29/log4js-koa2/)

## log4js.js(未使用)
log4js.js 中间件,将 log 挂在到 ctx 中

## global.js+global-logger.js(未使用)
log4js.js 中间件,将 log 挂在到 ctx 中存在一个问题，那就是每一次 http 请求经过该中间件，都会重新进行 getLogger 操作，故而不妨把 logger 对象绑定到 global 上去，logger 中间件去调用 global 上的 logger 实例来进行日志操作

## my-logger.js(使用)
抽取 log4js 配置，并且增加日志记录信息

## logger.js(使用)
抽取 koa-logger 配置，并且增加请求日志记录信息
