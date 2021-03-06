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

ActiveRecord::Schema.define(version: 2019_03_11_233525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "examples", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id"
  end

  create_table "layouts", force: :cascade do |t|
    t.string "layout_name"
    t.bigint "template_id"
    t.bigint "user_id"
    t.boolean "is_public", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_layouts_on_template_id"
    t.index ["user_id"], name: "index_layouts_on_user_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "name", null: false
    t.string "format"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "section_layouts", force: :cascade do |t|
    t.bigint "section_id"
    t.bigint "layout_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["layout_id"], name: "index_section_layouts_on_layout_id"
    t.index ["section_id"], name: "index_section_layouts_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "sectype_id"
    t.string "format"
    t.index ["sectype_id"], name: "index_sections_on_sectype_id"
    t.index ["user_id"], name: "index_sections_on_user_id"
  end

  create_table "sectypes", force: :cascade do |t|
    t.string "name"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.string "author_url"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "path"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "examples", "users"
  add_foreign_key "layouts", "templates"
  add_foreign_key "layouts", "users"
  add_foreign_key "resumes", "users"
  add_foreign_key "section_layouts", "layouts"
  add_foreign_key "section_layouts", "sections"
  add_foreign_key "sections", "sectypes"
  add_foreign_key "sections", "users"
end
