FactoryBot.define do
  factory :samurai do
    name { Faker::Name.name }
    armor { Random.rand(1000) }
    battles  { Random.rand(20) }
    died_at { Faker::Date.between(2.years.ago, Date.today) }
    association :clan
  end
end
