# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  clan = Clan.create!(name: Faker::Team.unique.creature.capitalize)
  5.times do
    clan.samurais.create!(
      name:               Faker::Name.unique.first_name,
      armor_quality:      Faker::Number.between(1, 100),
      number_of_battles:  Faker::Number.between(1, 10),
      join_date:          Faker::Date.between(25.years.ago, 5.years.ago),
      death_date:         nil
    )
  end
end
