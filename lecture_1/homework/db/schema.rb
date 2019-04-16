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

ActiveRecord::Schema.define(version: 2019_04_16_180514) do

  create_table "buildings", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "clans", force: :cascade do |t|
    t.string "name", limit: 256, null: false
    t.index ["name"], name: "index_clans_on_name", unique: true
  end

  create_table "granaries", force: :cascade do |t|
    t.integer "food", default: 10, null: false
    t.integer "building_id"
    t.index ["building_id"], name: "index_granaries_on_building_id"
  end

  create_table "warriors", force: :cascade do |t|
    t.string "name", limit: 256, null: false
    t.integer "armor", null: false
    t.integer "battles", null: false
    t.datetime "join_date", null: false
    t.datetime "death_date"
    t.integer "clan_id"
    t.string "type", default: "Samurai"
    t.string "defensible_type"
    t.integer "defensible_id"
    t.index ["clan_id"], name: "index_warriors_on_clan_id"
    t.index ["defensible_type", "defensible_id"], name: "index_warriors_on_defensible_type_and_defensible_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "type", default: "melee", null: false
    t.integer "range", null: false
    t.integer "warrior_id"
    t.integer "damage", default: 0, null: false
    t.index ["warrior_id"], name: "index_weapons_on_warrior_id"
  end

end
