class RemoveColumnsFromNotifications < ActiveRecord::Migration[5.1]
  def change
  	remove_column :notifications, :recipient_id, :integer
  	remove_column :notifications, :sender_id, :integer
  end
end
