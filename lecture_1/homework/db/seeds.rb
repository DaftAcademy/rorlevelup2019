require 'faker'

5.times do
  Clan.create!(
    name: Faker::Games::ElderScrolls.race
    )
end

20.times do
  Samurai.create!(
    name: Faker::Games::ElderScrolls.unique.name,
    armour: Faker::Number.between(0, 1000),
    battles: Faker::Number.between(0, 21),
    join_date: Faker::Date.backward(40000),
    clan_id: Faker::Number.between(1, 5) 
    )
end

7.times do
  Samurai.create!(
    name: Faker::Games::ElderScrolls.unique.name,
    armour: Faker::Number.between(0, 1000),
    battles: Faker::Number.between(0, 21),
    join_date: Faker::Date.birthday(18, 70),
    death_date: Faker::Date.birthday(0, 10),
    clan_id: Faker::Number.between(1, 5)
    )
end
