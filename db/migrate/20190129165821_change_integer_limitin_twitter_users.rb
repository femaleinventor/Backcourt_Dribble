class ChangeIntegerLimitinTwitterUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :twitter_users, :twitter_id, :bigint
  end
end
