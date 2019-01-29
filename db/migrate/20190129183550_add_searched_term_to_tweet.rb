class AddSearchedTermToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :searched_term, :string
  end
end
