class CreateTweeters < ActiveRecord::Migration[5.1]
  def change
    create_table :tweeters do |t|
      t.string :name
      t.string :twitter_handle
      t.string :status
      t.integer :priority
      t.primary_key :sport_id

      t.timestamps
    end
  end
end
