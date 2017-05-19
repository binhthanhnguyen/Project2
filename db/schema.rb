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

ActiveRecord::Schema.define(version: 20170328080015) do

  create_table "curriculum_vitaes", force: :cascade do |t|
    t.text     "objective"
    t.text     "work_experience"
    t.text     "qualifications"
    t.text     "education"
    t.text     "skills"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_curriculum_vitaes_on_user_id"
  end

  create_table "internship_recruitments", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.text     "required_qualifications"
    t.text     "prefered_qualifications"
    t.text     "benefits"
    t.text     "company"
    t.string   "status",                  default: "pending"
    t.integer  "user_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["user_id"], name: "index_internship_recruitments_on_user_id"
  end

  create_table "internship_registrations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "internship_recruitment_id"
    t.string   "status",                    default: "pending"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["internship_recruitment_id"], name: "index_internship_registrations_on_internship_recruitment_id"
    t.index ["user_id", "internship_recruitment_id"], name: "registrations", unique: true
    t.index ["user_id"], name: "index_internship_registrations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
