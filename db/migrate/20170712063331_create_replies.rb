class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
    	t.string :answer

      t.timestamps
    end
  end
end
