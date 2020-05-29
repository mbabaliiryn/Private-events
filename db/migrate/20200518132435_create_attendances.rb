class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.string :attendee_id
      t.references :event, foreign_key: true
      t.boolean :attending, :default => false
      

      t.timestamps
    end
  end
end
