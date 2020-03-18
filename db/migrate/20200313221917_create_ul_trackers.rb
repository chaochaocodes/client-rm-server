class CreateUlTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :ul_trackers do |t|
      t.string :status
      t.string :tracker_id
      t.string :users_listing_id
      
      t.timestamps
    end
  end
end
