# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "Zak", email: "zkolar@brandeis.edu", password:"12345678", admin:true)
User.create(name: "Hannah", email: "hmoser@brandeis.edu", password:"12345678", admin:true)
User.create(name: "Maria", email: "maltebar@brandeis.edu", password:"awkward1", admin:true)
User.create(name: "Abby", email: "abcooper@brandeis.edu", password:"12345678", admin:true)