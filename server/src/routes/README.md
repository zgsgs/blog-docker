# 配置路由目录

koa-router路由中间件 封装路由 实现自动加载注册指定目录下的路由文件

## 请求路径规范

/api/controllers 模块名称/请求的方法名
例如： `http://127.0.0.1:7003/api/user/test`

如果模块名有 `-` 则替换成 `/`
例如：`http://127.0.0.1:7003/api/user/info/test`
