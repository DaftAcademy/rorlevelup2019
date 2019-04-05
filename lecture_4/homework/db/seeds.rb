# frozen_string_literal: true

first_clan = Clan.create!(name: 'The very first clan')
training_clan = Clan.create!(name: 'Training clan')

stronghold = Buildings::Stronghold.create!(name: 'Main stronghold')
northern_wall = Buildings::Walls.create!(name: 'Northern wall')
southern_wall = Buildings::Walls.create!(name: 'Southern wall')

samurai_1 = Warriors::Samurai.create!(name: '曽山大輝', clan: first_clan, death_date: 1.week.ago)
samurai_2 = Warriors::Samurai.create!(name: '曽山大輝', clan: first_clan, building: stronghold)
samurai_3 = Warriors::Samurai.create!(name: '澄田清', clan: training_clan, building: stronghold)
hussar_1 = Warriors::Hussar.create!(name: 'Idzi Kwiatkowski', clan: first_clan, building: northern_wall)
hussar_2 = Warriors::Hussar.create!(name: 'Świętopełk Król', clan: training_clan, building: southern_wall)

unavailable_mercenary = Mercenary.create!(name: 'Cosimo Smallburrow', experience: 10, preferred_weapon_kind: 'melee', price: 100, available_from: 10.day.from_now)
available_mercenary = Mercenary.create!(name: 'Priamus Brandagamba', experience: 5, preferred_weapon_kind: 'ranged', price: 20, available_from: 5.day.ago)
expensive_mercenary = Mercenary.create!(name: 'Tanta Mugwort', experience: 50, preferred_weapon_kind: 'ranged', price: 200, available_from: 5.day.ago)

Weapons::Katana.create!(warrior: samurai_2, range: 3, damage: 30)
Weapons::Katana.create!(warrior: samurai_3, range: 2, damage: 35)
Weapons::Musket.create!(warrior: hussar_1, range: 50, damage: 10)
Weapons::Musket.create!(warrior: hussar_2, range: 60, damage: 8)
