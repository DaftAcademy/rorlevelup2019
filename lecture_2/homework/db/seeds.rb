# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# 10.times do
# klan = Clan.create!(name: Faker::Games::ElderScrolls.race)
# end

klan1 = Clan.create!(name: 'Klan_Debski22')
klan2 = Clan.create!(name: 'Klan_Wawer22')
twierdza     = Stronghold.create(name: 'Twierdza_X22')
samurai_one  = Samurai.create(name: 'Madek22', clan: klan1, defensible: twierdza)
samurai_two  = Samurai.create(name: 'Kasia22', clan: klan2, defensible: twierdza)
sword        = Sword.create(name: 'Super_Sword_One122', damage: 100, range: 2, warrior: samurai_one)
range = Ranged.create(name: 'Ala_ma_kota122', damage: 10, range: 20, warrior: samurai_two)

p sword
puts range
