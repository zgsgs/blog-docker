const { Strategy, ExtractJwt } = require('passport-jwt')
const JwtStrategy = Strategy
const { secretOrKey } = require('@root/config/keys')
const Users = require('@mysql/Users')
// mysql
// mongodb
// const mongoose = require('mongoose')
// const Users = mongoose.model('users')

module.exports = (passport) => {
  passport.use(
    new JwtStrategy({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      secretOrKey,
    },
    async (jwt_payload, done) => {
      // mysql
      const user = await Users.findOne({ where: { id: jwt_payload.id } })
      // mongodb
      // const user = await Users.findById(jwt_payload.id)
      if (user)
        return done(null, user)

      return done(null, false, '用户不存在')
    }),
  )
}
