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

ActiveRecord::Schema.define(version: 20140401175658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "giftlists", force: true do |t|
    t.string  "name"
    t.string  "note"
    t.string  "giftee"
    t.integer "user_id"
  end

  add_index "giftlists", ["user_id"], name: "index_giftlists_on_user_id", using: :btree

  create_table "giftlists_gifts", id: false, force: true do |t|
    t.integer "giftlist_id"
    t.integer "gift_id"
  end

  create_table "gifts", force: true do |t|
    t.string  "name"
    t.integer "price"
    t.string  "category"
    t.integer "giftlist_id"
    t.integer "tag_id"
  end

  add_index "gifts", ["giftlist_id"], name: "index_gifts_on_giftlist_id", using: :btree
  add_index "gifts", ["tag_id"], name: "index_gifts_on_tag_id", using: :btree

  create_table "gifts_tags", id: false, force: true do |t|
    t.integer "gift_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "gift_id"
  end

  add_index "tags", ["gift_id"], name: "index_tags_on_gift_id", using: :btree

  create_table "users", force: true do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.date   "birthday"
    t.string "password_digest"
  end

end
