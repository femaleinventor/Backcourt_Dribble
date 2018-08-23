class AddSoundLinkToSports < ActiveRecord::Migration[5.1]
  def change
    add_column :sports, :sound_link, :string
  end
end
