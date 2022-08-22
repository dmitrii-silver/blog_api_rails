FactoryBot.define do
  factory :comment, class: Comment do

    body { Faker::Hipster.sentence }
    published_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }

    association :user
    # association :post

  end
end
