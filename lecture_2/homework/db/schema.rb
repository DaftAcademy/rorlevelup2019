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

ActiveRecord::Schema.define(version: 2019_04_02_193549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clans", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strongholds", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "towers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trees", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "defensible_type"
    t.bigint "defensible_id"
    t.index ["clan_id"], name: "index_warriors_on_clan_id"
    t.index ["defensible_type", "defensible_id"], name: "index_warriors_on_defensible_type_and_defensible_id"
    t.index ["name"], name: "index_warriors_on_name", unique: true
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name", null: false
    t.string "type"
    t.integer "damage", default: 1
    t.integer "range", default: 1
    t.bigint "warrior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warrior_id"], name: "index_weapons_on_warrior_id"
  end

  add_foreign_key "warriors", "clans"
  add_foreign_key "weapons", "warriors"
end
