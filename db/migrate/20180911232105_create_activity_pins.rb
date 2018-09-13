class CreateActivityPins < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_pins do |t|
      t.references :activity, foreign_key: true
      t.references :pin, foreign_key: true
    end
  end
end