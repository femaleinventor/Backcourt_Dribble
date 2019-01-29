class AddRuntimeToKeywords < ActiveRecord::Migration[5.1]
  def change
    add_column :keywords, :runtime, :datetime
  end
end
