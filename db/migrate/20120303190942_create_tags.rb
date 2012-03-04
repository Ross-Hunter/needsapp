class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :need

      t.timestamps
    end
    add_index :tags, :need_id
  end
end
