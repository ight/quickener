class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.belongs_to :restourant, index: true
      t.string :shift_type
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
