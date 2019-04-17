# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
