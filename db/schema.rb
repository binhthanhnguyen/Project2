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

ActiveRecord::Schema.define(version: 20170524085936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "mentor_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "internship_assignment_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["internship_assignment_id"], name: "index_assignments_on_internship_assignment_id", using: :btree
  end

  create_table "criterions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curriculum_vitaes", force: :cascade do |t|
    t.text     "objective"
    t.text     "work_experience"
    t.text     "qualifications"
    t.text     "education"
    t.text     "skills"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_curriculum_vitaes_on_user_id", using: :btree
  end

  create_table "evaluation_criteria", force: :cascade do |t|
    t.integer  "criterion_id"
    t.integer  "point"
    t.text     "comment"
    t.integer  "evaluation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["criterion_id"], name: "index_evaluation_criteria_on_criterion_id", using: :btree
    t.index ["evaluation_id"], name: "index_evaluation_criteria_on_evaluation_id", using: :btree
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "assignment_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assignment_id"], name: "index_evaluations_on_assignment_id", using: :btree
    t.index ["user_id"], name: "index_evaluations_on_user_id", using: :btree
  end

  create_table "internship_assignments", force: :cascade do |t|
    t.integer  "internship_recruitment_id"
    t.integer  "lecturer_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["internship_recruitment_id"], name: "index_internship_assignments_on_internship_recruitment_id", using: :btree
  end

# Could not dump table "internship_recruitments" because of following StandardError
#   Unknown type 'recruitment_status' for column 'status'

# Could not dump table "internship_registrations" because of following StandardError
#   Unknown type 'status' for column 'status'

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
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "assignments", "internship_assignments"
  add_foreign_key "curriculum_vitaes", "users"
  add_foreign_key "evaluation_criteria", "criterions"
  add_foreign_key "evaluation_criteria", "evaluations"
  add_foreign_key "evaluations", "assignments"
  add_foreign_key "evaluations", "users"
  add_foreign_key "internship_assignments", "internship_recruitments"
  add_foreign_key "internship_recruitments", "users"
  add_foreign_key "internship_registrations", "internship_recruitments"
  add_foreign_key "internship_registrations", "users"
end
