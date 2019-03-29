FactoryBot.define do
  factory :samurai do
    name { Faker::Name.unique.first_name }
    armor_quality { Faker::Number.between(1, 100) }
    number_of_battles { 0 }
    join_date { Faker::Date.between(25.years.ago, Date.today) }
    death_date { nil }
    clan_id { nil }
  end
end
