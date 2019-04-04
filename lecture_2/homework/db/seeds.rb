# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clans = Clan.create!([{ name: 'Mononobe' },
                      { name: 'Soga' },
                      { name: 'Fujiwara' },
                      { name: 'Minamoto' }])

tower = Tower.create!(name: 'Orthanc')

gate = Gate.create!(name: 'Black_gate')

masahiro = Warrior.create!(name: 'Masahiro',
                           armor_quality: 72,
                           number_of_battles: 54,
                           join_date: '1819-05-04',
                           death_date: nil,
                           clan: clans.first,
                           type: 'Samurai',
                           defensible: tower)

janusz = Warrior.create!(name: 'Janusz',
                         armor_quality: 54,
                         number_of_battles: 23,
                         join_date: '1827-08-07',
                         death_date: '1848-06-07',
                         clan: clans.first,
                         type: 'Hussar',
                         defensible: gate)

izami = Warrior.create!(name: 'Izami',
                        armor_quality: 24,
                        number_of_battles: 65,
                        join_date: '1819-05-04',
                        death_date: nil,
                        clan: clans.first,
                        type: 'Archer',
                        defensible: tower)

thor = Warrior.create!(name: 'Thor',
                       armor_quality: 100,
                       number_of_battles: 1000,
                       join_date: '1827-08-07',
                       death_date: '1848-06-07',
                       clan: clans.last,
                       type: 'Hussar',
                       defensible: gate)

masahiro.create_weapon(name: 'Excalibur',
                       range: 2,
                       damage: 60,
                       type: 'Melee')

thor.create_weapon(name: 'Mjolnir',
                   range: 100,
                   damage: 100,
                   type: 'Magical')

izami.create_weapon(name: 'Bow',
                    range: 80,
                    damage: 20,
                    type: 'Ranged')

janusz.create_weapon(name: 'CrossBow',
                     range: 90,
                     damage: 40,
                     type: 'Ranged')
