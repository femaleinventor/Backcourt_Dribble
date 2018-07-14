class AddStartToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :start, :datetime
  end
end
