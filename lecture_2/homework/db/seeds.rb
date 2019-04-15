# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

clan_names = ["MotorLubin","LegiaWarszawa","Chalmianka","Leczna"]
clan_names.each do |n|
Clan.create(name: n)
end


Wall.create(name: "wall1")
Tower.create(name: "tower1")
Gate.create(name: "gate1")
Fortress.create(name: "fortress1")

samurai_params = [
    {name: "Marek", armor_quality: 0, number_of_battles: 100, clan_id: 1,defensible_id: 1,defensible_type: 'Wall'},
    {name: "Tomek", armor_quality: 0, number_of_battles: 100, clan_id: 2,defensible_id: 1,defensible_type: 'Fortress'},
    {name: "Adam", armor_quality: 0, number_of_battles: 100, clan_id: 3,defensible_id: 1,defensible_type: 'Gate'},
    {name: "Piotrek", armor_quality: 0, number_of_battles: 100, clan_id: 4,defensible_id: 1,defensible_type: 'Wall'},
    {name: "Damian", armor_quality: 0, number_of_battles: 100, clan_id: 1,defensible_id: 1,defensible_type: 'Gate'},
    {name: "Kuba", armor_quality: 0, number_of_battles: 100, clan_id: 2,defensible_id: 1,defensible_type: 'Tower'},
    {name: "Jakub", armor_quality: 0, number_of_battles: 100, clan_id: 3,defensible_id: 1,defensible_type: 'Fortress'},
    {name: "Michal", armor_quality: 0, number_of_battles: 100, clan_id: 4,defensible_id: 1,defensible_type: 'Wall'},
    {name: "Olek", armor_quality: 0, number_of_battles: 100, clan_id: 1,defensible_id: 1,defensible_type: 'Wall'}
]
samurai_params.each do |n|
Wiking.create(name: n[:name]+"as",armor_quality: n[:armor_quality],number_of_battles: n[:number_of_battles], clan_id: n[:clan_id], defensible_id: n[:defensible_id], defensible_type: n[:defensible_type])
Hussar.create(name: n[:name]+"Kowalski",armor_quality: n[:armor_quality],number_of_battles: n[:number_of_battles], clan_id: n[:clan_id], defensible_id: n[:defensible_id], defensible_type: n[:defensible_type])
Wizard.create(name: n[:name]+"iks",armor_quality: n[:armor_quality],number_of_battles: n[:number_of_battles], clan_id: n[:clan_id], defensible_id: n[:defensible_id], defensible_type: n[:defensible_type])
Archer.create(name: n[:name]+"s",armor_quality: n[:armor_quality],number_of_battles: n[:number_of_battles], clan_id: n[:clan_id], defensible_id: n[:defensible_id], defensible_type: n[:defensible_type])
Samurai.create(name: n[:name]+"oooo",armor_quality: n[:armor_quality],number_of_battles: n[:number_of_battles], clan_id: n[:clan_id], defensible_id: n[:defensible_id], defensible_type: n[:defensible_type])
end

weapon_params = [
    {name: "Izte"},
    {name: "Wize"},
    {name: "Mite"},
    {name: "Ibe"},
    {name: "Terter"},
    {name: "Hame"},
    {name: "Spade"},
    {name: "Wade"},
    {name: "Mezite"},
]

weapon_params.each_with_index do |n ,index|
index*=5
Melee.create(name: n[:name]+"lor", warrior_id: 1+index).valid?
Melee.create(name: n[:name]+"rel", warrior_id: 2+index).valid?
Magical.create(name: n[:name]+"ling", warrior_id: 3+index).valid?
Ranged.create(name: n[:name], warrior_id: 4+index).valid?
Melee.create(name: n[:name]+"lololo", warrior_id: 5+index).valid?
end
