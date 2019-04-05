# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  clan = Clan.create(name: 'Superclan')
  Clan.create(name: 'Plague')
  construction = Barricade.create(name: 'Boom')
  warrior = Warrior.create!(clan: clan, name: 'Abe Masakatsu', 
                                        construction: construction)
  warrior.create_weapon
  
  Warrior.create(clan: clan, name: 'Adachi Yasumori', 
                             construction: construction,
                             death_date: Date.today)
