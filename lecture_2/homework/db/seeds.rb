# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clan_1 = Clan.create!(name: 'Blooming cherry')
p '1 clan created'
p Samurai.create!(name: 'Mietek', armor_quality: 100, join_date: Date.today, clan: clan_1, defensible: Castle.create)
Samurai.create!(name: 'Mietek_ale_nieżywy', armor_quality: 23, join_date: Date.today, death_date: Date.today, clan: clan_1, defensible: Stronghold.create)
Bowman.create!(name: 'Mietek_ale_z_rogalem', armor_quality: 75, join_date: Date.today, clan: clan_1, defensible: Gate.create)
Canon.create!(name: 'Mietek_ale_armata', armor_quality: 75, join_date: Date.today, clan: clan_1, defensible: Gate.create)
Hussar.create!(name: 'Mietek_ale_Zagłoba', armor_quality: 100, join_date: Date.today, clan: clan_1, defensible: Gate.create)

p clan_1.warriors.map(&:attack)
# p 'army crated'