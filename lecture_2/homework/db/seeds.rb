# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

25.times do |index|
  Clan.create(
      name: index.to_s + "_" + Faker::Games::Witcher.school
  )
end

3.times do
  Stronghold.create
  Tower.create
  Gate.create
  Wall.create
end

Clan.all.each do |clan|
  3.times do |index|
    witcher = Witcher.create(
        name: Faker::Games::Witcher.witcher + " " + index.to_s,
        armor_quality: rand(90..100),
        number_of_battles: rand(100),
        join_date: Date.today - rand(200),
        death_date: rand(0..4) > 2 ? (Date.today - rand(1000)) : nil,
        clan_id: clan.id,
        defensible_type: :Tower,
        defensible_id: Tower.first.id
    )

    Sword.create(
        damage: rand(90..100),
        warrior_id: witcher.id
    )

    archer = Archer.create(
        name: Faker::Games::ElderScrolls.name + " " + index.to_s,
        armor_quality: rand(10..20),
        number_of_battles: rand(30),
        join_date: Date.today - rand(100),
        death_date: rand(0..4) > 2 ? (Date.today - rand(1000)) : nil,
        clan_id: clan.id,
        defensible_type: :Wall,
        defensible_id: Wall.first.id
    )

    Bow.create(
        damage: rand(30..70),
        warrior_id: archer.id
    )

    samurai = Samurai.create(
        name: Faker::Games::SonicTheHedgehog.character + " " + index.to_s,
        armor_quality: rand(0..100),
        number_of_battles: rand(500),
        join_date: Date.today - rand(500),
        death_date: rand(0..5) > 2 ? (Date.today - rand(1000)) : nil,
        clan_id: clan.id,
        defensible_type: :Stronghold,
        defensible_id: Stronghold.first.id
    )

    Sword.create(
        damage: rand(90..100),
        warrior_id: samurai.id
    )
  end
end