class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :high
      t.string :low
      t.string :sky
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
