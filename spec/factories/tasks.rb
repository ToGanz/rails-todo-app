FactoryBot.define do
  factory :task do
    project
    title { Faker::Lorem.word }
    due_date { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    priority { Faker::Number.between(from: 1, to: 5) }
    description { Faker::Lorem.sentence(word_count: 5) }
  end
end
