class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :title, :null => false
      t.integer :category_id
      t.text :desc
      t.date :date, :null => false,
	    t.text :time1
	    t.text :time2
	    t.text :time3
      t.boolean :is_repeat, :null => false, :default => 'FALSE'
      t.integer :frequency
      t.integer :num_repeats

      t.timestamps
    end
  end
end
