# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clan_1 = Clan.create!(name: 'Blooming cherry')
p '1 clan created'
clan_1.samurais.create!(name: 'Mietek', armor: 100, join_date: Date.today)
clan_1.samurais.create!(name: 'Mietek_ale_nieżywy', armor: 100, join_date: Date.today, death_date: Date.today)
p '1 clans samurai created'

