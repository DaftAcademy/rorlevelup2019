# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  clan = Clan.create(name: 'Superclan')
  Clan.create(name: 'Plague')
  barricade = Barricade.create
  Warrior.create(clan: clan, name: 'Abe Masakatsu', 
                             defensible: barricade)
  Warrior.create(clan: clan, name: 'Adachi Yasumori', 
                             defensible: barricade, 
                             death_date: Date.today)
