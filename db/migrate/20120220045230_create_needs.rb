class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :title
      t.text :desc
      t.date :date

      t.timestamps
    end
  end
end
