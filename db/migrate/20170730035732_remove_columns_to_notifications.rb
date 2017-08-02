class RemoveColumnsToNotifications < ActiveRecord::Migration[5.1]
  def change
    remove_column :notifications, :recipient_id, :string
    remove_column :notifications, :sender_id, :string
  end
end
