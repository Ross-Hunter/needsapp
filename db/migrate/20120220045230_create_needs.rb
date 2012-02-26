class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.string :title
      t.text :desc
      t.datetime :datetime1

      t.timestamps
    end
  end
end
