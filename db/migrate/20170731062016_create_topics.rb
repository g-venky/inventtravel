class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.text :discussion
      t.text :details
      t.integer :discussion_id

      t.timestamps
    end
  end
end
