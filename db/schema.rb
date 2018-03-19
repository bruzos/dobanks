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

ActiveRecord::Schema.define(version: 20180302105239) do

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "bank_id"
    t.bigint "user_id"
    t.string "iban_string"
    t.integer "balance_cents", default: 0, null: false
    t.string "balance_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_accounts_on_bank_id"
    t.index ["iban_string"], name: "index_accounts_on_iban_string", unique: true
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "banks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bank_code"
    t.integer "transfer_fee_cents", default: 0, null: false
    t.string "transfer_fee_currency", default: "USD", null: false
    t.integer "transfer_limit_cents", default: 0, null: false
    t.string "transfer_limit_currency", default: "USD", null: false
  end

  create_table "transaction_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "account_id"
    t.bigint "transaction_type_id"
    t.integer "among_cents", default: 0, null: false
    t.string "among_currency", default: "USD", null: false
    t.integer "fee_cents", default: 0, null: false
    t.string "fee_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["transaction_type_id"], name: "index_transactions_on_transaction_type_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
