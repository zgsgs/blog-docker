const mount = require('koa-mount')
const graphqlHTTP = require('koa-graphql')
const GraphQLSchema = require('@/schema/default')

module.exports = () => {
  return mount('/graphql', graphqlHTTP({
    schema: GraphQLSchema,
    graphiql: true,
  }))
}
