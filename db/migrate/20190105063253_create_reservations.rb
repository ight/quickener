class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.belongs_to :restourant, index: true
      t.belongs_to :guest, index: true
      t.belongs_to :shift, index: true
      t.belongs_to :table, index: true
      t.datetime :reservation_time

      t.timestamps
    end
  end
end
