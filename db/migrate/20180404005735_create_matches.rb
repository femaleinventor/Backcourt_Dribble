class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :result
      t.string :channel
      t.date :date
      t.time :time
      t.references :league, foreign_key: true
      t.references :home_team
      t.references :away_team
      t.references :sport, foreign_key: true
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
