# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create!(name: "RAD",
                    email: "rad2020rmit@gmail.com",
                    password: "Rails2020",
                    password_confirmation: "Rails2020",
                    mobile: "0909430116",
                    city: "Melbourne",
                    introduction: "I am beautiful !",
                    activated: true,
                    activated_at: Time.zone.now,
                    admin: true )
Card.create!(user_id: user.id)

user = User.create!(name: "tung",
             email: "tung.coder1993@gmail.com",
             password: "12341234",
             password_confirmation: "12341234",
             mobile: "0416959292",
             city: "Melbourne",
             introduction: "I am beautiful !",
             activated: true,
             activated_at: Time.zone.now,
             admin: true )
Card.create!(user_id: user.id)

user = User.create!(name: "Kan",
             email: "kan.coder1992@gmail.com",
             password: "12341234",
             password_confirmation: "12341234",
             mobile: "0416959292",
             city: "Melbourne",
             introduction: "I am beautiful !",
             activated: true,
             activated_at: Time.zone.now,
             admin: true )

Card.create!(user_id: user.id)

NewsPost.create!(title: "Hello World",
                 content: "Give me your money !!!!",
                 author_id: 1,
                 total_comment: 0,
                 total_view: 0,
                 category: "VR")

NewsPost.create!(title: "The World is under danger",
                content: "We are the most dangerous type.",
                author_id: 2,
                total_comment: 55,
                total_view: 200,
                 category: "RMIT")

Category.create!(name: "News")
Category.create!(name: "RMIT")
Category.create!(name: "Animal")
Category.create!(name: "AI")
Category.create!(name: "VR")
Category.create!(name: "Dog")

Comment.create!(content: "Its really nice !",
                user_id: 1,
                post_id: 1)

Comment.create!(content: "Oops...sth goes wrong.",
                user_id: 2,
                post_id: 1)


Comment.create!(content: "Hello. Thats sound good !",
                user_id: 2,
                post_id: 1)

5.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  mobile = "0909430116"

  user = User.create!(name: name,
               email: email,
               password: password,
               mobile: mobile,
               city: "Melbourne",
               introduction: "I am beautiful !",
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)

  Card.create!(user_id: user.id)
end