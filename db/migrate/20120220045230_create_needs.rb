class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :title
      t.text :desc
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
