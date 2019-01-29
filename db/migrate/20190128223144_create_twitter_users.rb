class CreateTwitterUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :twitter_users do |t|
      t.integer :twitter_id
      t.datetime :created
      t.string :description
      t.integer :followers_count
      t.string :location
      t.string :name
      t.string :screen_name
      t.string :profile_image
      t.string :time_zone
      t.boolean :verified

      t.timestamps
    end
  end
end
