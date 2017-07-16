class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
    	t.string :action
  		t.boolean :read 

      t.timestamps
    end
  end
end
