class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :abbreviation
      t.string :nickname
      t.string :home_field
      t.string :bright_color
      t.string :light_color
      t.string :dark_color
      t.string :twitter_list

      t.timestamps
    end
  end
end
