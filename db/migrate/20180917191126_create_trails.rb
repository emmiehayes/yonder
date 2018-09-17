class CreateTrails < ActiveRecord::Migration[5.1]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :location
      t.string :length
      t.string :difficulty
      t.string :elevation_high
      t.string :elevation_low
      t.float :latitude
      t.float :longitude
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end



  