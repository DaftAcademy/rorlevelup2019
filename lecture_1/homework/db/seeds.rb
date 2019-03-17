# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'time'
Samurai.delete_all
Clan.delete_all
clans = Clan.create([{name: 'biiru'},{name: 'wo'},{name: 'nomimashita'} ])
Samurai.create([{name: 'WaiWai',armor_quality: 999,clan:clans.first,joined: DateTime.now.to_date},{name: 'Jedi', armor_quality: 555,clan: clans.first,joined: DateTime.now.to_date},
    {name: 'SoBa', armor_quality: 1,clan: clans[2],joined: DateTime.now.to_date},{name: 'Kejsatsukan', armor_quality: 990, clan: clans.last,joined: DateTime.now.to_date}])
