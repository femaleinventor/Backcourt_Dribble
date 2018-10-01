class AddTimeZoneToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :time_zone, :string
  end
end
