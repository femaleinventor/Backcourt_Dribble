class ChangePointsDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :points, :integer, :default => 0
  end
end
