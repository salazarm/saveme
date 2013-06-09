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

ActiveRecord::Schema.define(:version => 20130609174129) do

  create_table "incident_reports", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "incident_reports_people", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "incident_report_id"
  end

  create_table "messasges", :force => true do |t|
    t.integer  "videoconference_id"
    t.integer  "person_id"
    t.text     "content"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.boolean  "is_anon"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
    t.string   "auth_token"
    t.string   "phone"
    t.boolean  "in_call"
  end

  create_table "schedules", :force => true do |t|
    t.integer  "person_id"
    t.integer  "timeslot_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "timeslots", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "day"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "videoconferences", :force => true do |t|
    t.integer  "saver"
    t.integer  "savee"
    t.integer  "savee_rating"
    t.integer  "saver_rating"
    t.integer  "savee_id"
    t.integer  "saver_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "auth_token"
  end

end
