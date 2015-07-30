# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
for i in 1..10 do
  u = User.find_by_email("user#{i}@example.com")
  User.create(username: "user#{i}", email: "user#{i}@example.com", password: "12345678", password_confirmation: "12345678") unless u
end