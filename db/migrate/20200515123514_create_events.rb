class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :about
      t.datetime :day
      t.string :location
      t.integer :creator_id

      t.timestamps
    end
  end
end
