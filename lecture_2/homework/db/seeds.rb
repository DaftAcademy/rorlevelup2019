# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



3.times do
  clan = Clan.create!(name: Faker::Creature::Cat.unique.registry)
  Faker::Number.between(2, 10).times do
    clan.characters.create!(
      name:     Faker::Creature::Cat.unique.name,
      number_of_battles:  Faker::Number.between(0, 200),
      armor_quality:    Faker::Number.between(0, 1000),
      join_date:   Faker::Date.birthday(20, 70),
      death_date:     nil
	  )
  end
  Faker::Number.between(1, 5).times do
    clan.characters.create!(
      name:     Faker::Creature::Cat.unique.name,
      number_of_battles:  Faker::Number.between(0, 200),
      armor_quality:    Faker::Number.between(0, 1000),
      join_date:   Faker::Date.birthday(20, 70),
      death_date:     Faker::Date.backward(20)
	  )
  end
end