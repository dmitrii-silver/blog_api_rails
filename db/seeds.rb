20.times do
  user = User.create({nickname: Faker::Name.name, email: Faker::Internet.email, password: "1234567", password_confirmation: "1234567"})
  user.posts.create({title: Faker::Book.title, body: Faker::Lorem.sentence, user: user, published_at: Faker::Date.between(from: 2.days.ago, to: Date.today)})
  user.comments.create({body: Faker::Lorem.sentence, user: user, published_at: Faker::Date.between(from: 2.days.ago, to: Date.today)})
end
