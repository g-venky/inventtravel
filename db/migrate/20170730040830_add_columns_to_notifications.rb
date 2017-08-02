class AddColumnsToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :recipient_id, :integer
    add_column :notifications, :sender_id, :integer
  end
end
