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

ActiveRecord::Schema.define(version: 2019_12_19_115710) do

  create_table "bought_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_profile_id"
    t.bigint "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_bought_products_on_buyer_id"
    t.index ["product_id"], name: "index_bought_products_on_product_id"
    t.index ["user_profile_id"], name: "index_bought_products_on_user_profile_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_profile_id"
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_profile_id"], name: "index_comments_on_user_profile_id"
  end

  create_table "cwavetests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_profile_id"
    t.bigint "category_id"
    t.string "name", null: false
    t.text "description", null: false
    t.integer "status", null: false
    t.integer "who_charge_shipping", null: false
    t.integer "way_of_shipping", null: false
    t.integer "shipping_region", null: false
    t.integer "how_long_shipping", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["user_profile_id"], name: "index_products_on_user_profile_id"
  end

  create_table "saling_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_saling_products_on_product_id"
    t.index ["user_profile_id"], name: "index_saling_products_on_user_profile_id"
  end

  create_table "sold_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_profile_id"
    t.bigint "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_sold_products_on_buyer_id"
    t.index ["product_id"], name: "index_sold_products_on_product_id"
    t.index ["user_profile_id"], name: "index_sold_products_on_user_profile_id"
  end

  create_table "tops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "post_number", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "house_number", null: false
    t.string "building_name"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "nickname", null: false
    t.text "profile"
    t.string "avator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "phone_number", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birth_day", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bought_products", "products"
  add_foreign_key "bought_products", "user_profiles"
  add_foreign_key "bought_products", "user_profiles", column: "buyer_id"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "user_profiles"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "user_profiles"
  add_foreign_key "saling_products", "products"
  add_foreign_key "saling_products", "user_profiles"
  add_foreign_key "sold_products", "products"
  add_foreign_key "sold_products", "user_profiles"
  add_foreign_key "sold_products", "user_profiles", column: "buyer_id"
  add_foreign_key "user_addresses", "users"
  add_foreign_key "user_profiles", "users"
end
