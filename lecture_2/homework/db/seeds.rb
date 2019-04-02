# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stronghold = Stronghold.create! name: "Hollow's keep"
barricade = Barricade.create! name: "Northern walls"

3.times do
  clan = Clan.create!(name: Faker::Team.unique.creature.capitalize)

  barricade.warriors.create!(
    name:               Faker::Name.unique.first_name,
    armor_quality:      Faker::Number.between(1, 100),
    number_of_battles:  Faker::Number.between(1, 10),
    join_date:          Faker::Date.between(25.years.ago, 5.years.ago),
    death_date:         nil,
    type:               Musketeer,
    clan_id:            clan.id
  ).create_weapon!(
    name:   Faker::Games::Witcher.unique.monster,
    damage: Faker::Number.between(1, 15),
    range:  8
  )

  stronghold.warriors.create!(
    name:               Faker::Name.unique.first_name,
    armor_quality:      Faker::Number.between(1, 100),
    number_of_battles:  Faker::Number.between(1, 10),
    join_date:          Faker::Date.between(25.years.ago, 5.years.ago),
    death_date:         Faker::Date.backward(3000),
    type:               Samurai,
    clan_id:            clan.id
  ).create_weapon!(
    name:   Faker::Games::Witcher.unique.monster,
    damage: Faker::Number.between(1, 20),
    range:  2
  )
end
