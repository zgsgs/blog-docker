const { Strategy, ExtractJwt } = require('passport-jwt')
const JwtStrategy = Strategy
const { keys: config } = require('@root/config')
const User = require('@mysql/User')

let opts = {}
opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken()
opts.secretOrKey = config.secretOrKey
module.exports = passport => {
  passport.use(
    new JwtStrategy(opts, async (jwt_payload, done) => {
      const user = await User.findAll({ where: { id: jwt_payload.id } })
      if (!user) {
        return done(null, false)
      }
      return done(null, user)
    })
  )
}
