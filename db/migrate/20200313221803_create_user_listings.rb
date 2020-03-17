class CreateUserListings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_listings do |t|

      t.timestamps
    end
  end
end
