FactoryBot.define do
  factory :samurai do
    name { Faker::WorldOfWarcraft.hero }
    armor_quality { Faker::Number.number(1000) }
    battle_count { Faker::Number.number(100) }
    joined_at nil
    died_at nil
    clan_id nil
  end
end