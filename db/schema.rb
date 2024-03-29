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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120412105653) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "configurables", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "configurables", ["name"], :name => "index_configurables_on_name"

  create_table "needs", :force => true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.text     "desc"
    t.date     "date"
    t.text     "time1"
    t.text     "time2"
    t.text     "time3"
    t.boolean  "is_repeat", :null => false, :default => 0
    t.integer  "frequency"
    t.integer  "num_repeats"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "slots", :force => true do |t|
    t.string   "name"
    t.string   "note"
    t.integer  "need_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "slots", ["need_id"], :name => "index_slots_on_need_id"

  create_table "users", :force => true do |t|
    t.string   "label"
    t.string   "password_hash"
    t.boolean  "admin"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
