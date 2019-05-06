# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Clan.create!(name: 'Black Swamp')
Building.create!(name: 'Toad Castle', type: 'Fortress', defense: 23)
Building.create!(name: 'Frog Tower', type: 'Tower', defense: 8)
Weapon.create!(name: 'Angry rock', type: 'Ranged', damage: 3, range: 89)
Weapon.create!(name: 'Deadly katana', type: 'Melee', damage: 8, range: 3)
Weapon.create!(name: 'Mighty ax', type: 'Melee', damage: 9, range: 4)
Weapon.create!(name: 'Sacred ring', type: 'Magical', damage: 4, range: 55)
Weapon.create!(name: 'Green crossbow', type: 'Ranged', damage: 2, range: 100)
Weapon.create!(name: 'Long sword', type: 'Melee', damage: 6, range: 3)
Weapon.create!(name: 'Magical shoes', type: 'Magical', damage: 3, range: 42)
Warrior.create!(name: 'Big toad', clan_id: 1, type: 'Hussar', defensible_type: 'Fortress', defensible_id: 1, equipment_type: 'Melee', equipment_id: 3)
Warrior.create!(name: 'Sam the frog', clan_id: 1, defensible_type: 'Fortress', defensible_id: 1, equipment_type: 'Melee', equipment_id: 2)
Warrior.create!(name: 'Green bowman', clan_id: 1, type: 'Archer', defensible_type: 'Tower', defensible_id: 2, equipment_type: 'Ranged', equipment_id: 1)
Warrior.create!(name: 'Forest tadpole', clan_id: 1, type: 'Druid', defensible_type: 'Tower', defensible_id: 2, equipment_type: 'Magical', equipment_id: 4)
