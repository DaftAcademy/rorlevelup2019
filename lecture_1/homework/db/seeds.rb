# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clans = Clan.create([{ name: 'Mononobe' },
                     { name: 'Soga' },
                     { name: 'Fujiwara' },
                     { name: 'Minamoto' }])

Samurai.create(name: 'Masahiro',
               armor: 720,
               battle_count: 54,
               join_at: '1819-05-04',
               death_at: nil,
               clan_id: clans.first.id)

Samurai.create(name: 'Shiro',
               armor: 540,
               battle_count: 23,
               join_at: '1827-08-07',
               death_at: '1848-06-07',
               clan_id: clans.first.id)

Samurai.create(name: 'Izami',
               armor: 240,
               battle_count: 65,
               join_at: '1819-05-04',
               death_at: nil,
               clan_id: clans.first.id)

Samurai.create(name: 'Tamatari',
               armor: 35,
               battle_count: 45,
               join_at: '1827-08-07',
               death_at: '1848-06-07',
               clan_id: clans.first.id)

Samurai.create(name: 'Shingen',
               armor: 86,
               battle_count: 36,
               join_at: '1829-05-04',
               death_at: '1869-05-04',
               clan_id: clans.last.id)

Samurai.create(name: 'Kanetsugu',
               armor: 77,
               battle_count: 200,
               join_at: '1857-04-02',
               death_at: nil,
               clan_id: clans.last.id)
