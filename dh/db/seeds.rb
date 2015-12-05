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
User.create(name: "Susie", email: "susie@brandeis.edu", password:"12345678", admin:false)
User.create(name: "Jacob", email: "jacob@brandeis.edu", password:"12345678", admin:false)
User.create(name: "Antonella", email: "antonella@brandeis.edu", password:"12345678", admin:false)
Assignment.create(due_date: DateTime.new(2018, 8, 29, 22, 35, 0),description: "This is your first assignment", title: "First assignment")
Step.create(id: 5, user_id: 6, assignment_id: 1, title: "Unsuccessful", url: "somewebsite.com", justification: "", parent_id: nil, favorite: false, document: false, created_at: "2015-12-05 18:06:55", updated_at: "2015-12-05 18:06:55", screenshot: nil)
Step.create(id: 6, user_id: 6, assignment_id: 1, title: "This looks promising", url: "anotherwebsite.com", justification: "", parent_id: nil, favorite: false, document: false, created_at: "2015-12-05 18:07:16", updated_at: "2015-12-05 18:07:42", screenshot: nil)
Step.create(id: 7, user_id: 6, assignment_id: 1, title: "Getting closer", url: "someotherwebsite.com", justification: "", parent_id: 6, favorite: false, document: false, created_at: "2015-12-05 18:07:31", updated_at: "2015-12-05 18:07:42", screenshot: nil)
Step.create(id: 8, user_id: 6, assignment_id: 1, title: "Found it!", url: "success.com", justification: "", parent_id: 7, favorite: false, document: true, created_at: "2015-12-05 18:07:42", updated_at: "2015-12-05 18:07:49", screenshot: nil)