class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :prop_type
      t.integer :price
      t.integer :year_built
      t.string :city
      t.string :line
      t.string :postal_code
      t.string :state_code
      t.string :state
      t.string :county
      t.integer :beds
      t.integer :baths
      t.integer :sqft
      t.integer :hoa_fee
      t.string :list_date
      t.string :mls_id
      t.string :photo

      t.timestamps
    end
  end
end
