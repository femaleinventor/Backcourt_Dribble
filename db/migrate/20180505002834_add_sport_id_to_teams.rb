class AddSportIdToTeams < ActiveRecord::Migration[5.1]
  def change
    add_reference :teams, :sport, foreign_key: true
  end
end
