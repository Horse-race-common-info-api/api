FactoryBot.define do
  factory :race do
    name { Faker::Name.name }
    race_round { Faker::Number.number(digits: 2) }
    association :held
    association :course
  end
end
