FactoryBot.define do
  factory :held do
    held_year { Faker::Number.number(digits: 2) }
    held_month { Faker::Number.number(digits: 2) }
    held_day { Faker::Number.number(digits: 2) }
    number_of_times { Faker::Number.number(digits: 2) }
    number_of_days { Faker::Number.number(digits: 2) }
    racecourse_id { 1 }
  end
end
