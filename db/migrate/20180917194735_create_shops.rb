class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string  :sid
      t.string  :name
      t.string  :address
      t.string  :phone
      t.string  :price
      t.float   :longitude
      t.float   :latitude
      t.string  :url

      t.timestamps
    end
  end
end
