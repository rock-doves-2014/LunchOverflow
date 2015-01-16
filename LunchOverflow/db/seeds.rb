require 'faker'

10.times do
  Post.create(title: Faker::Company.name, content: Faker::Company.catch_phrase, address: Faker::Address.street_name, user_id: rand(1..4))
end

50.times do
  Comment.create(content: Faker::Lorem.sentence, user_id: rand(1..5), post_id: rand(1..10))
end

User.create(user_name: 'kevin', email: 'kevin@kevin.com', password: '123')
User.create(user_name: 'daniel', email: 'daniel@daniel.com', password: '123')
User.create(user_name: 'brian', email: 'brian@brian.com', password: '123')
User.create(user_name: 'carl', email: 'carl@carl.com', password: '123')
User.create(user_name: 'test', email: 'test@test.com', password: '123')
