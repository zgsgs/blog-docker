const {
  GraphQLObjectType,
  GraphQLString,
  GraphQLInt,
  GraphQLSchema,
  GraphQLList,
  GraphQLNonNull,
  GraphQLID,
} = require('graphql')
const DB = require('@/model/mongodb')

// 定义导航Schema类型
const GraphQLNav = new GraphQLObjectType({
  name: 'nav',
  fields: {
    title: { type: GraphQLString },
    url: { type: GraphQLString },
    sort: { type: GraphQLInt },
    status: { type: GraphQLInt },
    add_time: { type: GraphQLString },
  },
})

// 定义根
const QueryRoot = new GraphQLObjectType({
  name: 'RootQueryType',
  fields: {
    navList: {
      type: GraphQLList(GraphQLNav),
      async resolve(parent, args) {
        const navList = await DB.find('nav', {})
        // eslint-disable-next-line no-console
        console.log(navList)
        return navList
      },
    },
  },
})

// 增加数据
const MutationRoot = new GraphQLObjectType({
  name: 'Mutation',
  fields: {
    addNav: {
      type: GraphQLNav,
      args: {
        title: { type: new GraphQLNonNull(GraphQLString) },
        description: { type: new GraphQLNonNull(GraphQLString) },
        keywords: { type: GraphQLString },
        pid: { type: GraphQLString },
        add_time: { type: GraphQLString },
        status: { type: GraphQLID },
      },
      async resolve(parent, args) {
        const cateList = await DB.insert('nav', {
          title: args.title,
          description: args.description,
          keywords: args.keywords,
          pid: 0,
          add_time: '',
          status: 1,
        })
        // eslint-disable-next-line no-console
        console.log(cateList.ops[0])
        return cateList.ops[0]
      },
    },
  },
})

module.exports = new GraphQLSchema({
  query: QueryRoot,
  mutation: MutationRoot,
})
