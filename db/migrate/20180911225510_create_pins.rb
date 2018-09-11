class CreatePins < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
      t.string :city
      t.string :state
      t.float  :longitude
      t.float  :latitude
    end
  end
end
