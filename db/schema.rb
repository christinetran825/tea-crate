# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171127203606) do

  create_table "tea_types", force: :cascade do |t|
    t.integer "tea_id"
    t.integer "type_id"
  end

  create_table "teas", force: :cascade do |t|
    t.string  "tea_name"
    t.string  "brand"
    t.integer "user_id"
    t.string  "origin"
    t.string  "leaves"
    t.string  "caffeine"
    t.string  "pairing"
    t.string  "brew_time"
    t.string  "tasting_notes"
    t.string  "comments"
    t.integer "rating"
  end

  create_table "types", force: :cascade do |t|
    t.string "type_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
