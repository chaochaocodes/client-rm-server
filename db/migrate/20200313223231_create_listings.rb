class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :prop_type
      t.string :price
      t.string :address
      t.integer :beds
      t.integer :baths
      t.string :sqft
      t.string :photo
      t.string :city_state
      t.string :city
      t.string :state
      t.string :rdc_web_url

      t.timestamps
    end
  end
end
