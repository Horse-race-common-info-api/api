FactoryBot.define do
  factory :course do
    racecourse_id { 1 }
    coursetype_id { 1 }
    course_length { Faker::Number.number(digits: 4) }
  end
end
