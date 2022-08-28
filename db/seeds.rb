5.times do
  user = User.create({nickname: Faker::Name.name, email: Faker::Internet.email, password: "1234567", password_confirmation: "1234567"})
end

users = User.all

users.each do |user|
  rand(7).times do
    Post.create({title: Faker::Book.title, body: Faker::Lorem.sentence, user: user, published_at: Faker::Date.between(from: 2.days.ago, to: Date.today)})
  end
end

posts = Post.all

users.each do |user|
  posts.each do |post|
    Comment.create({body: Faker::Lorem.sentence, post: post, user: user, published_at: Faker::Date.between(from: 2.days.ago, to: Date.today)})
  end
end
