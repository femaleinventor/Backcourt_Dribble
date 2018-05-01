class CreatePredictions < ActiveRecord::Migration[5.1]
  def change
    create_table :predictions do |t|
      t.string :guess
      t.text :reason
      t.boolean :correct?
      t.integer :likes
      t.references :user, foreign_key: true
      t.references :match, foreign_key: true
    end
  end
end
