class AddTimezoneToVenue < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :timezone, :string
  end
end
