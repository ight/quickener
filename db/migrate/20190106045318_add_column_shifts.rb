class AddColumnShifts < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :start_time, :datetime
    add_column :shifts, :end_time, :datetime
  end
end
