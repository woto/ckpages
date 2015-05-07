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

ActiveRecord::Schema.define(version: 20150425152740) do

  create_table "ckpages_pages", force: :cascade do |t|
    t.text     "path"
    t.text     "content"
    t.text     "keywords"
    t.text     "description"
    t.text     "title"
    t.text     "robots"
    t.text     "redirect_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "title1"
    t.text     "url1"
    t.text     "title2"
    t.text     "url2"
    t.text     "title3"
    t.text     "url3"
    t.text     "title4"
    t.text     "url4"
    t.text     "title5"
    t.text     "url5"
  end

  create_table "ckpages_uploads", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
