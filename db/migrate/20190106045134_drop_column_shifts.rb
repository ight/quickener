class DropColumnShifts < ActiveRecord::Migration[5.2]
  def change
    remove_column :shifts, :start_time
    remove_column :shifts, :end_time
  end
end
