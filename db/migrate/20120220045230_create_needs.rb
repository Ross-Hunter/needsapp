class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :title
      t.text :desc
      t.date :date
	    t.text :time1
	    t.text :time2
	    t.text :time3

      t.timestamps
    end
  end
end
