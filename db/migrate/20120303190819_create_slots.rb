class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :name
      t.string :notes
      t.references :need

      t.timestamps
    end
    add_index :slots, :need_id
  end
end
