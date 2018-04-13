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

ActiveRecord::Schema.define(version: 20180413084205) do

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypt_password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cd_items", force: :cascade do |t|
    t.string "cd_title"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_cd_items_on_item_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_carts", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "cart_id", null: false
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "artist", null: false
    t.string "title_name", null: false
    t.string "label", null: false
    t.integer "price", null: false
    t.integer "stock", null: false
    t.text "image_id", null: false
    t.integer "admin_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["admin_id"], name: "index_items_on_admin_id"
    t.index ["genre_id"], name: "index_items_on_genre_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "leaves", force: :cascade do |t|
    t.string "leave_reason", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_leaves_on_user_id"
  end

  create_table "order_histories", force: :cascade do |t|
    t.datetime "buy_day", null: false
    t.string "destination", null: false
    t.integer "summary_price"
    t.integer "summary_count"
    t.integer "user_id"
    t.integer "item_id"
    t.integer "status_id"
    t.integer "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_histories_on_item_id"
    t.index ["payment_id"], name: "index_order_histories_on_payment_id"
    t.index ["status_id"], name: "index_order_histories_on_status_id"
    t.index ["user_id"], name: "index_order_histories_on_user_id"
  end

  create_table "order_history_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "order_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_history_items_on_item_id"
    t.index ["order_history_id"], name: "index_order_history_items_on_order_history_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "song_title", null: false
    t.integer "song_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_item_id"], name: "index_songs_on_song_item_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_addresses", force: :cascade do |t|
    t.string "sub_postal_code", null: false
    t.string "sub_address", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sub_addresses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_kana", null: false
    t.string "first_kana", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "tell", null: false
    t.string "mail_address", null: false
    t.string "encrypt_password", null: false
    t.datetime "delete_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
