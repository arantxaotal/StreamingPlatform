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

ActiveRecord::Schema.define(version: 20250210190133) do

  create_table "apps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string   "original_title",      null: false
    t.integer  "year"
    t.integer  "duration_in_seconds"
    t.json     "availabilities"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "content_id"
    t.index ["content_id"], name: "index_apps_on_content_id", using: :btree
  end

  create_table "channel_programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string   "original_title",      null: false
    t.integer  "year"
    t.integer  "duration_in_seconds"
    t.integer  "channel_id",          null: false
    t.json     "schedule"
    t.json     "availabilities"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "content_id"
    t.index ["channel_id"], name: "index_channel_programs_on_channel_id", using: :btree
    t.index ["content_id"], name: "index_channel_programs_on_content_id", using: :btree
  end

  create_table "channels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.integer  "number",     null: false
    t.integer  "app_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_channels_on_app_id", using: :btree
  end

  create_table "chapters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.integer  "number",              null: false
    t.string   "original_title",      null: false
    t.integer  "year"
    t.integer  "duration_in_seconds"
    t.integer  "season_id",           null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["season_id"], name: "index_chapters_on_season_id", using: :btree
  end

  create_table "contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.integer  "number",              null: false
    t.string   "original_title",      null: false
    t.integer  "year"
    t.integer  "duration_in_seconds"
    t.integer  "app_id",              null: false
    t.json     "availabilities"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["app_id"], name: "index_seasons_on_app_id", using: :btree
  end

  add_foreign_key "apps", "contents"
  add_foreign_key "channel_programs", "channels"
  add_foreign_key "channel_programs", "contents"
  add_foreign_key "channels", "apps"
  add_foreign_key "chapters", "seasons"
  add_foreign_key "seasons", "apps"
end
