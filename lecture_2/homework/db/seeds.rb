# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

x = 0

2.times do
  clan = Clan.create!(name: Faker::Creature::Cat.unique.registry)
  Faker::Number.between(2, 10).times do
    sam = SamuraiWarrior.create!(
      name:     Faker::Creature::Cat.name + x.to_s,
      number_of_battles:  Faker::Number.between(0, 200),
      armor_quality:    Faker::Number.between(0, 1000),
      join_date:   Faker::Date.birthday(20, 70),
      death_date:     nil,
	  clan:	clan
	  )
	# MeleeWeapon.create!(
	# name: Faker::Appliance.equipment + " of " + [Faker::Ancient.god, Faker::Ancient.primordial, Faker::Ancient.titan, Faker::Ancient.hero].sample,
	# damage: Faker::Number.between(0, 100),
	# range: Faker::Number.between(0, 3),
	# me_wpnable: sam
	# )
	x=x+1
  end
  Faker::Number.between(2, 10).times do
    hus = HussarMage.create!(
      name:     Faker::Creature::Cat.name + x.to_s,
      number_of_battles:  Faker::Number.between(0, 200),
      armor_quality:    Faker::Number.between(0, 1000),
      join_date:   Faker::Date.birthday(20, 70),
      death_date:     nil,
	  clan:	clan
	  )
	# MagicalWeapon.create!(
	# name: Faker::Appliance.equipment + " of " + [Faker::Ancient.god, Faker::Ancient.primordial, Faker::Ancient.titan, Faker::Ancient.hero].sample,
	# damage: Faker::Number.between(0, 100),
	# range: Faker::Number.between(0, 100),
	# ma_wpnable: hus
	# )
	x=x+1
  end
  Faker::UniqueGenerator.clear
  Faker::Number.between(1, 5).times do
    sam = SamuraiWarrior.create!(
      name:     Faker::Creature::Cat.name + x.to_s,
      number_of_battles:  Faker::Number.between(0, 200),
      armor_quality:    Faker::Number.between(0, 1000),
      join_date:   Faker::Date.birthday(20, 70),
      death_date:     Faker::Date.backward(20),
	  clan:	clan
	  )
	# MeleeWeapon.create!(
	# name: Faker::Appliance.equipment + " of " + [Faker::Ancient.god, Faker::Ancient.primordial, Faker::Ancient.titan, Faker::Ancient.hero].sample,
	# damage: Faker::Number.between(0, 100),
	# range: Faker::Number.between(0, 3),
	# me_wpnable: sam
	# )
	x=x+1
  end
  Faker::Number.between(1, 5).times do
    hus = HussarMage.create!(
      name:     Faker::Creature::Cat.name + x.to_s,
      number_of_battles:  Faker::Number.between(0, 200),
      armor_quality:    Faker::Number.between(0, 1000),
      join_date:   Faker::Date.birthday(20, 70),
      death_date:     Faker::Date.backward(20),
	  clan:	clan
	  )
	# MagicalWeapon.create!(
	# name: Faker::Appliance.equipment + " of " + [Faker::Ancient.god, Faker::Ancient.primordial, Faker::Ancient.titan, Faker::Ancient.hero].sample,
	# damage: Faker::Number.between(0, 100),
	# range: Faker::Number.between(0, 100),
	# ma_wpnable: hus
	# )
	x=x+1
  end
  
end