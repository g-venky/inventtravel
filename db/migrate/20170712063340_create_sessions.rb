class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
    	t.string :client_id
  		t.string :signature
  		t.boolean :connected

      t.timestamps
    end
  end
end
