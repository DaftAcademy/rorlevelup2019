# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c1 = Clan.create!(name: 'Minamoto')
d = Stronghold.create!(name: 'Himeji')
s1 = Samurai.create!(name: 'Tokugawa', clan: c1,defensible: d)
s2 = Samurai.create!(name: 'Hoji', clan: c1,defensible: d)
sword = Sword.create!(name: 'Amaterasu',damage: 100,range: 2,warrior: s1)
ranged = Ranged.create!(name: 'Chidori' , damage: 10, range: 20, warrior: s2)
#
