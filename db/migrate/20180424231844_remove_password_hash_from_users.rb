class RemovePasswordHashFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password_hash, :string
  end
end
