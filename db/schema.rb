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

ActiveRecord::Schema.define(version: 20190129183550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type"
    t.bigint "favoritable_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hashtags_tweets", force: :cascade do |t|
    t.bigint "hashtag_id"
    t.bigint "tweet_id"
    t.index ["hashtag_id"], name: "index_hashtags_tweets_on_hashtag_id"
    t.index ["tweet_id"], name: "index_hashtags_tweets_on_tweet_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "runtime"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_leagues_on_sport_id"
  end

  create_table "leagues_teams", id: false, force: :cascade do |t|
    t.bigint "league_id", null: false
    t.bigint "team_id", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "result"
    t.string "channel"
    t.time "time"
    t.bigint "league_id"
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.bigint "sport_id"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start"
    t.string "time_zone"
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["league_id"], name: "index_matches_on_league_id"
    t.index ["sport_id"], name: "index_matches_on_sport_id"
    t.index ["venue_id"], name: "index_matches_on_venue_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "fifa_team"
    t.string "league_team1"
    t.string "league_team2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "predictions", force: :cascade do |t|
    t.string "guess"
    t.text "reason"
    t.boolean "correct?"
    t.integer "likes"
    t.bigint "user_id"
    t.bigint "match_id"
    t.index ["match_id"], name: "index_predictions_on_match_id"
    t.index ["user_id"], name: "index_predictions_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.string "sound_link"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "nickname"
    t.string "bright_color"
    t.string "light_color"
    t.string "dark_color"
    t.string "twitter_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sport_id"
    t.index ["sport_id"], name: "index_teams_on_sport_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "tweet_id"
    t.string "tweet_id_str"
    t.datetime "created"
    t.string "full_text"
    t.bigint "favorite_count"
    t.bigint "retweet_count"
    t.string "source"
    t.bigint "twitter_user_id"
    t.integer "quoted_tweet_id"
    t.bigint "statuses_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "searched_term"
    t.index ["twitter_user_id"], name: "index_tweets_on_twitter_user_id"
  end

  create_table "twitter_users", force: :cascade do |t|
    t.bigint "twitter_id"
    t.datetime "created"
    t.string "description"
    t.bigint "followers_count"
    t.string "location"
    t.string "name"
    t.string "screen_name"
    t.string "profile_image"
    t.string "time_zone"
    t.boolean "verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "twitter_handle"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.string "country"
    t.string "level"
    t.string "stripeToken"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "time_zone"
    t.string "avatar"
    t.string "slug"
    t.boolean "admin", default: false
    t.integer "points", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "picture_url"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "hashtags_tweets", "hashtags"
  add_foreign_key "hashtags_tweets", "tweets"
  add_foreign_key "leagues", "sports"
  add_foreign_key "matches", "leagues"
  add_foreign_key "matches", "sports"
  add_foreign_key "matches", "venues"
  add_foreign_key "predictions", "matches"
  add_foreign_key "predictions", "users"
  add_foreign_key "teams", "sports"
  add_foreign_key "tweets", "twitter_users"
end
