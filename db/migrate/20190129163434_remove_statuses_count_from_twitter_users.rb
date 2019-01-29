class RemoveStatusesCountFromTwitterUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :twitter_users, :statuses_count, :integer
  end
end
