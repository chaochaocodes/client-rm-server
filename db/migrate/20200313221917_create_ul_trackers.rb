class CreateUlTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :ul_trackers do |t|
      t.string :status

      t.timestamps
    end
  end
end
