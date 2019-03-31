FactoryBot.define do
  factory :samurai do
    name { Faker::Name.name }
    armor_quality { Random.rand(100) }
    number_of_battles { Random.rand(20) }
    death_date { Faker::Date.between(2.years.ago, Date.today) }
    join_date { Faker::Date.between(4.years.ago, 3.years.ago) }
    association :clan    
  end
end
