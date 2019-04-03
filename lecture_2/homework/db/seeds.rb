# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'faker'

10.times do
 klan = Clan.create!(name: Faker::Games::ElderScrolls.race)
end



#klan         = Clan.create!(name: Faker::Name)
#twierdza     = Stronghold.create!(name: Faker::House::ElderScrolls.race)
#samurai_one  = Samurai.create!(name: Faker::Name::ElderScrolls.race, clan: klan, defensible: twierdza)
#samurai_two  = Samurai.create!(name: Faker::Name::ElderScrolls.race, clan: klan, defensible: twierdza)
#sword        = Sword.create!(name: Faker::Name::ElderScrolls.race, damage: 100, range: 2, warrior: samurai_one )
#range        = Range.create!(name: Faker::Name::ElderScrolls.race, damage: 10, range: 20, warrior: samurai_two)
