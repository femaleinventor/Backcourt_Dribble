class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :fifa_team
      t.string :league_team1
      t.string :league_team2

      t.timestamps
    end
  end
end
