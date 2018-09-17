class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string  :name
      t.string  :location
      t.string  :phone
      t.string  :price
      t.float   :longitude
      t.float   :latitude
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
