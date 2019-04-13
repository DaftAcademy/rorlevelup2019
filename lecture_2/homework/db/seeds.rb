# frozen_string_literal: true

require 'faker'

5.times do
  Clan.create!(
    name: Faker::Games::ElderScrolls.unique.race
  )
end

20.times do
  Samurai.create!(
    name: Faker::Games::ElderScrolls.unique.name,
    armor_quality: Faker::Number.between(0, 100),
    number_of_battles: Faker::Number.between(0, 21),
    join_date: Faker::Date.backward(40_000),
    clan_id: Faker::Number.between(1, 5)
  )
end

7.times do
  Samurai.create!(
    name: Faker::Games::ElderScrolls.unique.name,
    armor_quality: Faker::Number.between(0, 100),
    number_of_battles: Faker::Number.between(0, 21),
    join_date: Faker::Date.birthday(18, 70),
    death_date: Faker::Date.birthday(0, 10),
    clan_id: Faker::Number.between(1, 5)
  )
end
