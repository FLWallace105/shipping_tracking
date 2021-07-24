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

ActiveRecord::Schema.define(version: 2021_07_24_220121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "container_milestones", force: :cascade do |t|
    t.string "container_id"
    t.datetime "milestone_timestamp"
    t.string "location_name"
    t.string "location_city"
    t.string "location_country"
    t.string "location_unlocode"
    t.string "location_facility"
    t.string "description"
    t.string "raw_descripition"
    t.string "vessel_imo"
    t.string "vessel_mmsi"
    t.string "voyage"
    t.string "mode"
    t.string "vessel"
    t.string "latitude"
    t.string "longitude"
    t.index ["container_id"], name: "index_container_milestones_on_container_id"
  end

  create_table "container_trackings", force: :cascade do |t|
    t.string "container_id"
    t.string "shipping_company"
    t.string "vizion_reference_id"
    t.string "vision_organization_id"
    t.string "bill_of_lading"
    t.jsonb "latest_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "finished_journey", default: false
    t.index ["container_id"], name: "index_container_trackings_on_container_id"
  end

end
