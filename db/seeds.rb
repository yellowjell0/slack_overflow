# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do

  user = User.create(user_name: Faker::Name.name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password')

  5.times do
    question = Question.create(title: Faker::Lorem.sentence, body: Faker::Lorem.sentence(5))
    user.questions << question
    rand(1..100).times do
      question.votes << Vote.create(vote_type: "up", user_id:rand(1..10))
    end
    rand(1..20).times do
      question.votes << Vote.create(vote_type: "down", user_id:rand(1..10))
    end
    rand(1..15).times do
      answer  = Answer.create(body: Faker::ChuckNorris.fact)
      answer.user = User.find(rand(1..User.count))
      question.answers << answer
      comment = Comment.create(body: Faker::ChuckNorris.fact)
      comment.user = User.find(rand(1..User.count))
      question.comments << Comment.create(body: Faker::ChuckNorris.fact, user_id: rand(1..User.count))
      answer.comments << Comment.create(body: Faker::ChuckNorris.fact, user_id: rand(1..User.count))
    end
  end

  user.save

end
