class FixTimezoneColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :timezone, :time_zone
  end
end
