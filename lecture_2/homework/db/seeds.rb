# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lo

2.times do |i|
  Clan.create(
    name: "Klan#{i+1}"
  )
end

50.times do |i|
  Warrior.create(
    name: ["Janek", "Piotrek", "Wacek", "Edward", "Ziutek", "Szczepan", "Karol"].sample,
    armor_quality: rand(100),
    number_of_battles: rand(10),
    death_date: [ rand(10.years).seconds.ago, nil, nil].sample,
    join_date: ["01.01.2000", "01.01.2001", "01.01.2002"].sample,
    clan_id: Clan.pluck(:id).sample,
    defensible: Tower.create,
    type: ["Husar", "Samurai", "Archer"].sample
  )
end

Samurai.all.size.times do |i|
  Melee.create(
    name: "Melee#{i}",
    damage: rand(10),
    range: [1,2].sample,
    warrior_id: Samurai.pluck(:id).sample, #jaki moglby byc lepsza metoda na przydzielanie broni wojownikom? uzywajac pluck, bron trafia do losowego id
  )
end
