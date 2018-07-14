class RemoveHomefieldFromTeams < ActiveRecord::Migration[5.1]
  def change
    remove_column :teams, :home_field, :string
  end
end
