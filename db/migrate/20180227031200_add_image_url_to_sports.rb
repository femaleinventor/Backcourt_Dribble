class AddImageUrlToSports < ActiveRecord::Migration[5.1]
  def change
    add_column :sports, :image_url, :string
  end
end
