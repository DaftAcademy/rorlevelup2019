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

ActiveRecord::Schema.define(version: 2019_04_14_111449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "granary", default: 0, null: false
  end

  create_table "clans", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "warriors_count", default: 0, null: false
  end

  create_table "mercenaries", force: :cascade do |t|
    t.string "name"
    t.integer "experience"
    t.string "preferred_weapon_kind"
    t.datetime "available_from"
    t.integer "price"
    t.bigint "warrior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warrior_id"], name: "index_mercenaries_on_warrior_id", unique: true
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
    t.string "type", default: "Warriors::Samurai", null: false
    t.bigint "building_id"
    t.string "preferred_weapon_kind"
    t.index ["building_id"], name: "index_warriors_on_building_id"
    t.index ["clan_id"], name: "index_warriors_on_clan_id"
    t.index ["name"], name: "index_warriors_on_name", unique: true, where: "(death_date IS NULL)"
  end

  create_table "weapons", force: :cascade do |t|
    t.bigint "warrior_id"
    t.integer "range"
    t.integer "damage"
    t.string "kind"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warrior_id"], name: "index_weapons_on_warrior_id"
  end

  add_foreign_key "mercenaries", "warriors"
  add_foreign_key "warriors", "buildings"
  add_foreign_key "warriors", "clans"
  add_foreign_key "weapons", "warriors"
end
