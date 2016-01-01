ActiveRecord::Schema.define(version: 20160101042224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text     "desc"
    t.time     "start"
    t.time     "end"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "activity_type_id"
  end

  add_index "activities", ["activity_type_id"], name: "index_activities_on_activity_type_id", using: :btree

  create_table "activity_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "keystroke"
  end

  add_foreign_key "activities", "activity_types"
end
