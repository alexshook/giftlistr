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

ActiveRecord::Schema.define(version: 20140327222238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "giftlists", force: true do |t|
    t.string  "name"
    t.string  "note"
    t.string  "giftee"
    t.integer "user_id_id"
  end

  add_index "giftlists", ["user_id_id"], name: "index_giftlists_on_user_id_id", using: :btree

  create_table "users", force: true do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.date   "birthday"
    t.string "password_digest"
  end

end
