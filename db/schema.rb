# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_08_214003) do

  create_table "auctions", force: :cascade do |t|
    t.string "name"
    t.boolean "private?"
    t.string "type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "duration"
  end

  create_table "bids", force: :cascade do |t|
    t.integer "listing_id"
    t.integer "buyer_id"
    t.decimal "amount"
    t.decimal "max_bid"
    t.boolean "winning_bid?"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "listing_id"
    t.integer "auction_id"
    t.string "category"
    t.string "keywords"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items_listings", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "listing_id", null: false
    t.index ["item_id"], name: "index_items_listings_on_item_id"
    t.index ["listing_id"], name: "index_items_listings_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "seller_id"
    t.integer "auction_id"
    t.decimal "reserve_price"
    t.decimal "bid_increment"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "starting_bid"
    t.integer "winning_bid_id"
    t.string "item_condition"
    t.integer "item_qty"
    t.integer "lot_size"
    t.boolean "active?"
    t.string "status"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "items_listings", "items"
  add_foreign_key "items_listings", "listings"
end
