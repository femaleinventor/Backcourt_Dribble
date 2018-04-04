class DropStadiaTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :stadia
  end
end
