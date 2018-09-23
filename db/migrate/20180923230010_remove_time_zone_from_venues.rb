class RemoveTimeZoneFromVenues < ActiveRecord::Migration[5.1]
  def change
    remove_column :venues, :time_zone
  end
end
