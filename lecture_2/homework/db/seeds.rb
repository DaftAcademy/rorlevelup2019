# frozen_string_literal: true

clan1 = Clan.create!(name: 'Blooming cherry')
clan2 = Clan.create!(name: 'Blooming apple')
p '1 clan created'
p mietek = Samurai.new(name: 'Mietek', armor_quality: 100, join_date: Date.today, clan: clan1, defensible: Castle.create)
laska = Magical.new(name: 'Magiczna laska')
mietek.weapon = laska
mietek.save
p mietek
p mietek2 = Samurai.new(name: 'Mietek', armor_quality: 100, join_date: Date.today, clan: clan2, defensible: Castle.create)
mietek2.weapon = Melee.new(name: 'Mieczyk')
mietek2.save
p mietek2
# p Samurai.create!(name: 'Mietek', armor_quality: 100, join_date: Date.today, clan: clan1, defensible: Castle.create)
p Samurai.create!(name: 'Mietek_ale_nieżywy', armor_quality: 23, join_date: Date.today, death_date: Date.today, clan: clan1, defensible: Stronghold.create)

p Samurai.create!(name: 'Mietek_ale_nieżywy', armor_quality: 23, join_date: Date.today, clan: clan1, defensible: Stronghold.create)

p Bowman.create!(name: 'Mietek_ale_z_rogalem', armor_quality: 75, join_date: Date.today, clan: clan1, defensible: Gate.create)

p Canon.create!(name: 'Mietek_ale_armata', armor_quality: 75, join_date: Date.today, clan: clan1, defensible: Gate.create)
p Hussar.create!(name: 'Mietek_ale_Zagłoba', armor_quality: 100, join_date: Date.today, clan: clan1, defensible: Gate.create)

p clan1.warriors.map(&:attack)