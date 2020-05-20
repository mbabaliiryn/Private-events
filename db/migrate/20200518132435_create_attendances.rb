class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.integer :attendee_id
      t.references :event, foreign_key: true
      

      t.timestamps
    end
  end
end
