class RenameTimezoneToTimeZone < ActiveRecord::Migration[5.1]
  def change
    rename_column :venues, :timezone, :time_zone
  end
end
