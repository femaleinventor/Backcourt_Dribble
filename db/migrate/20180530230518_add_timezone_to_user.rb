class AddTimezoneToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :timezone, :string
  end
end
