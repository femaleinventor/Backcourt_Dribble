class RemoveTimeFromMatches < ActiveRecord::Migration[5.1]
  def change
    remove_column :matches, :time
  end
end
