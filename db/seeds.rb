# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin: true)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end

User.create!(email: "example@railstutorial.org",
              password:              "foobar",
              password_confirmation: "foobar",
              profile: "0")

User.create!(email: "aldo@codea.com",
              password:              "123456",
              password_confirmation: "123456"
              profile: "0")

User.create!(email: "mau@codea.com",
              password:              "123456",
              password_confirmation: "123456"
              profile: "0")

Relation.create!(sudo: "1", company_id:"1", person_id:"1")
Relation.create!(sudo: "1", company_id:"1", person_id:"2")
Relation.create!(sudo: "1", company_id:"1", person_id:"3")