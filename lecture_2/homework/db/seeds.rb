# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Barricade.create( name: Faker::House.room )
Wall.create( name: Faker::House.room )
Castle.create( name: Faker::House.room )
Stronghold.create( name: Faker::House.room )
Tower.create( name: Faker::House.room )

10.times do
  Clan.create( name: Faker::Team.unique.name )
end
