class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :twitter_handle
      t.string :password_hash
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :country
      t.string :level
      t.string :stripeToken

      t.timestamps
    end
  end
end
