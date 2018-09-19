class CreateTrails < ActiveRecord::Migration[5.1]
  def change
    create_table :trails do |t|
      t.string :tid
      t.string :name
      t.string :location
      t.string :length
      t.string :elevation_high
      t.string :elevation_low
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end



  