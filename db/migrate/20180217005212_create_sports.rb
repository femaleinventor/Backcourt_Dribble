class CreateSports < ActiveRecord::Migration[5.1]
  def change
    create_table :sports do |t|
      t.string :name

      t.timestamps
    end
  end
end
