class CreateUsersListings < ActiveRecord::Migration[6.0]
  def change
    create_table :users_listings do |t|
      t.integer :user_id
      t.integer :listing_id
      
      t.timestamps
    end
  end
end
