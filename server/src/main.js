require('module-alias/register')
const koa = require('koa')
// Instantiate koa
const app = new koa()
// Initialize Models before import passport
const middlewares = require('@/middlewares')
middlewares(app)
// Initialize DataBase
require('@models/mysql')
// Clear
const clear = require('clear')
clear()

const port = process.env.PORT || 5000
app.listen(port, () => {
  console.log(`Server started on http://127.0.0.1:${port}`)
})
