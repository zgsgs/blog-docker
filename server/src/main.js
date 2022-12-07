require('module-alias/register')
// Initialize DataBase
require('@models/mysql')
const clear = require('clear')
const Koa = require('koa')
const middlewares = require('@/middlewares')

// Instantiate koa
const app = new Koa()
// Initialize Models before import passport
middlewares(app)
// Clear
clear()

const port = process.env.PORT || 5000
app.listen(port, () => {
  // eslint-disable-next-line no-console
  console.log(`Server started on http://127.0.0.1:${port}`)
})
