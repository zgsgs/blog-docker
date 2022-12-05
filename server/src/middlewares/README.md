# 中间件层
放置自定义中间件和三方中间件


## body.js
封装koa-body中间件
## static.js
封装koa-static静态资源中间件
## passport.js
封装passport-jwt中间件，解析token
## error.js
 自定义错误处理中间件

> 特别说明:
> 错误处理中间件中已引入 log4js 中间件,因此不需要在 index 文件中重复引用 否则会报重复挂载 log 对象的错误
