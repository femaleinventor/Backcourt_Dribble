class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :abbreviation
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
