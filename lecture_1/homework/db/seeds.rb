# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

10.times do
  Clan.create!(name: Faker::Games::ElderScrolls.race)
end

40.times do
  Samurai.create!(
      name: Faker::Games::ElderScrolls.unique.name,
      armour: Faker::Number.between(0, 1000),
      battles: Faker::Number.between(0, 21),
      join_date: Faker::Date.backward(40000),
      clan_id: Faker::Number.between(1, 5)
  )
end
