class CreateDealmessages < ActiveRecord::Migration[5.1]
  def change
    create_table :dealmessages do |t|
    	t.string :content

      t.timestamps
    end
  end
end
