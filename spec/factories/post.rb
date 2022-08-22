FactoryBot.define do
  factory :post, class: Post do

    title        { Faker::Name.name }
    body         { Faker::Hipster.sentence }
    published_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }

    association :user

  end
end
