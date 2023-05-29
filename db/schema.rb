# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_23_150952) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "components", force: :cascade do |t|
    t.bigint "forms_id"
    t.string "type"
    t.string "order"
    t.string "tag"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forms_id"], name: "index_components_on_forms_id"
  end

  create_table "forms", force: :cascade do |t|
    t.bigint "lifecycle_item_id"
    t.string "form_type"
    t.string "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lifecycle_item_id"], name: "index_forms_on_lifecycle_item_id"
  end

  create_table "input_fields", force: :cascade do |t|
    t.bigint "component_id"
    t.bigint "submission_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_input_fields_on_component_id"
    t.index ["submission_id"], name: "index_input_fields_on_submission_id"
  end

  create_table "lifecycle_items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "form_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_submissions_on_form_id"
  end

  add_foreign_key "components", "forms", column: "forms_id"
  add_foreign_key "forms", "lifecycle_items"
  add_foreign_key "input_fields", "components"
  add_foreign_key "input_fields", "submissions"
  add_foreign_key "submissions", "forms"
end
