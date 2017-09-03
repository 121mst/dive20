# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


30.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  nutzer = User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               uid: SecureRandom.uuid,
               )
  blog = Blog.create!(title: "test",
                        content: "TEST+TEST+TEST",
                        user_id: nutzer.id
                        )
           2.times do
               blog.comments.create!(content: "Yheeeeee!!!",
                                      user_id: nutzer.id)
           end

end
