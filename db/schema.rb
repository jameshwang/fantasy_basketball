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

ActiveRecord::Schema.define(:version => 20111228052628) do

  create_table "daily_rankings", :force => true do |t|
    t.integer  "rank"
    t.string   "team"
    t.float    "fg"
    t.float    "ft"
    t.float    "three_pm"
    t.float    "reb"
    t.float    "ast"
    t.float    "stl"
    t.float    "blk"
    t.float    "to"
    t.float    "pts"
    t.float    "tot_points"
    t.boolean  "ignore_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_standings", :force => true do |t|
    t.integer  "rk"
    t.string   "team"
    t.float    "fg"
    t.float    "ft"
    t.float    "three_pm"
    t.float    "reb"
    t.float    "ast"
    t.float    "stl"
    t.float    "blk"
    t.float    "to"
    t.float    "pts"
    t.integer  "gp"
    t.integer  "move"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "player_name"
    t.string   "owner_name"
    t.float    "fg_percentage"
    t.float    "ft_percentage"
    t.integer  "three_pts"
    t.integer  "reb"
    t.integer  "ast"
    t.integer  "stl"
    t.integer  "blk"
    t.integer  "to"
    t.integer  "pts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "rank"
  end

end
