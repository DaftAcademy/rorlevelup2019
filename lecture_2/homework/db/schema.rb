# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_05_103702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clans", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_clans_on_name", unique: true
  end

  create_table "constructions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", default: "Barricade"
    t.string "name", null: false
  end

  create_table "warriors", force: :cascade do |t|
    t.string "name", null: false
    t.integer "armor_quality", default: 0
    t.integer "number_of_battles", default: 0
    t.date "join_date"
    t.date "death_date"
    t.bigint "clan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", default: "Samurai"
    t.bigint "construction_id"
    t.bigint "weapon_id"
    t.index ["clan_id"], name: "index_warriors_on_clan_id"
    t.index ["construction_id"], name: "index_warriors_on_construction_id"
    t.index ["name", "clan_id"], name: "index_warriors_on_name_and_clan_id", unique: true, where: "(death_date IS NULL)"
    t.index ["weapon_id"], name: "index_warriors_on_weapon_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.integer "damage", default: 1
    t.integer "range", default: 2
    t.string "type", default: "MagicalWeapon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "warrior_id"
    t.index ["warrior_id"], name: "index_weapons_on_warrior_id"
  end

  add_foreign_key "warriors", "clans"
  add_foreign_key "warriors", "constructions"
  add_foreign_key "weapons", "warriors"
end
