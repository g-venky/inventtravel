class CreateUsefuls < ActiveRecord::Migration[5.1]
  def change
    create_table :usefuls do |t|
    	t.boolean :like
      t.timestamps
    end
  end
end
