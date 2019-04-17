# frozen_string_literal: true

require 'faker'

clan1 = Clan.create!(name: Faker::Creature::Cat.unique.registry)
clan2 = Clan.create!(name: Faker::Creature::Cat.unique.registry)
samurai1 = Samurai.create!(
  name: Faker::Creature::Cat.unique.name,
  armour_rating: Faker::Number.between(0, 1000),
  battle_count: Faker::Number.between(0, 200),
  join_date: Faker::Date.birthday(20, 70),
  death_date: Faker::Date.backward(20),
  clan: clan1
)
samurai2 = Samurai.create!(
  name: Faker::Creature::Cat.unique.name,
  armour_rating: Faker::Number.between(0, 1000),
  battle_count: Faker::Number.between(0, 200),
  join_date: Faker::Date.birthday(20, 70),
  death_date: Faker::Date.backward(20),
  clan: clan1
)
samurai3 = Samurai.create!(
  name: Faker::Creature::Cat.unique.name,
  armour_rating: Faker::Number.between(0, 1000),
  battle_count: Faker::Number.between(0, 200),
  join_date: Faker::Date.birthday(20, 70),
  death_date: Faker::Date.backward(20),
  clan: clan2
)
samurai4 = Samurai.create!(
  name: Faker::Creature::Cat.unique.name,
  armour_rating: Faker::Number.between(0, 1000),
  battle_count: Faker::Number.between(0, 200),
  join_date: Faker::Date.birthday(20, 70),
  death_date: Faker::Date.backward(20),
  clan: clan2
)
