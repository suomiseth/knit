# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Person.create(name: "seth")
Person.create(name: "mitch")
Person.create(name: "vinny")
Person.create(name: "ian")

User.create(name: "seth", person_id: 1)
InstagramAccount.create(handle: "@suomiseth", person_id: 1)
TwitterAccount.create(handle: "@suomiseth", person_id: 1)
FacebookAccount.create(handle: "@suomiseth", person_id: 1)

InstagramAccount.create(handle: "mitch", person_id: 2)
TwitterAccount.create(handle: "mitch", person_id: 2)
FacebookAccount.create(handle: "mitch", person_id: 2)

InstagramAccount.create(handle: "vinny", person_id: 3)
TwitterAccount.create(handle: "vinny", person_id: 3)
FacebookAccount.create(handle: "vinny", person_id: 3)

Follow.create(follower_id: 1, followee_id: 2)
Follow.create(follower_id: 1, followee_id: 3)
