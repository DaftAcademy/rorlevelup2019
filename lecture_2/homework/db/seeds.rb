# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def1 = Tower.create()
def2 = Turret.create()
def3 = Wall.create()
clan1 = Clan.create(name: "Wisła Kraków")
clan2 = Clan.create(name: "Arka Gdynia")
war1 = Samurai.create(clan: clan1, name:"Raiden", defensible: def1)
war2 = Archer.create(clan: clan2, name:"Sub Zero", defensible: def2)
war3 = Hussar.create(clan: clan1, name:"Reptile", defensible: def3)
war4 = Archer.create(clan: clan1, name:"Kitana", defensible: def3, death_date: "2017-08-02")
war5 = Samurai.create(clan: clan2, name:"Baraka", defensible: def2)
weapon1 = Melee.create(warrior:war1, range: 5, damage: 4, name: "Bójka")
weapon1 = Melee.create(warrior:war2, range: 10, damage: 14, name: "Fight")
weapon1 = Magical.create(warrior:war3, range: 50, damage: 1000, name: "Superbroń")
weapon1 = Magical.create(warrior:war4, range: 30, damage: 100, name: "Tajna broń")
weapon1 = Ranged.create(warrior:war5, range: 10, damage: 600, name: "Łuk")