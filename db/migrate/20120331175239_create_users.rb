class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :label
      t.string :password_hash
      t.boolean :admin

      t.timestamps
    end
  end
end
