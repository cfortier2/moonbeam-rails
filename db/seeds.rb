# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
  { username: "Attamusc", email: "sean@attamusc.com", name: "Sean Dunn", avatar: "https://avatars.githubusercontent.com/u/868737?v=2", remember_token: SecureRandom.hex(20) }
])

BuildRequest.create([
  { user: User.where(username: "Attamusc") }
])
