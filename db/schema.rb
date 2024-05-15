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

ActiveRecord::Schema[7.1].define(version: 2024_05_14_234909) do
  create_table "configuration_objects", force: :cascade do |t|
    t.integer "instance_id"
    t.integer "memory_in_gb"
    t.integer "storage_in_gb"
    t.integer "vcpus"
    t.integer "num_gpus"
    t.string "gpu_type"
    t.string "interconnect"
    t.integer "vram_per_gpu_in_gb"
    t.string "os"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instance_id"], name: "index_configuration_objects_on_instance_id"
  end

  create_table "instances", force: :cascade do |t|
    t.string "cloud"
    t.string "region"
    t.string "shade_instance_type"
    t.string "cloud_instance_type"
    t.string "cloud_assigned_id"
    t.boolean "shade_cloud"
    t.string "name"
    t.string "ip"
    t.string "ssh_user"
    t.integer "ssh_port"
    t.string "status", default: "active"
    t.string "cost_estimate"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
