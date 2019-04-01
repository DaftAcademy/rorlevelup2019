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

ActiveRecord::Schema.define(version: 2019_03_30_130701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barricades", force: :cascade do |t|
    t.string "name", null: false
    t.integer "amount_of_wood", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "castles", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number_of_residents", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clans", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_clans_on_name", unique: true
  end

  create_table "strongholds", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number_of_bricks", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "towers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "heigh", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "walls", force: :cascade do |t|
    t.string "name", null: false
    t.integer "thickness", default: 0
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
    t.index ["name", "clan_id"], name: "index_warriors_on_name_and_clan_id", unique: true, where: "(death_date IS NULL)"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name", null: false
    t.integer "range", default: 0
    t.integer "damage", default: 0
    t.bigint "warrior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", default: "Melee"
    t.index ["warrior_id"], name: "index_weapons_on_warrior_id"
  end

  add_foreign_key "warriors", "clans"
  add_foreign_key "weapons", "warriors"
end
