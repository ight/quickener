class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.belongs_to :restourant, index: true
      t.string :name
      t.integer :min_num
      t.integer :max_num

      t.timestamps
    end
  end
end
