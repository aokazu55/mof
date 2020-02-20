class AddIdToStation < ActiveRecord::Migration[5.2]
  def change
      create_table "homes", force: :cascade do |t|
        t.string "name", null: false
        t.integer "rent",  null: false
        t.text "address",  null: false
        t.integer "year",  null: false
        t.text "remarks", null: false
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "stations", force: :cascade do |t|
        t.string "line"
        t.string "station"
        t.integer "minute"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.integer "home_id"
        t.index ["home_id"], name: "index_stations_on_home_id"
      end
  end
end
