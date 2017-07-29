class Notification < ApplicationRecord
	 belongs_to :notifiable, polymorphic: true
  belongs_to :recipient, class_name: "User", inverse_of: :receiver
  belongs_to :sender, class_name: "User", inverse_of: :sent_by

  after_create :notify, if: Proc.new { |n| n.action != 'message' }

  def notify
    actions, action_type = if self.action == 'message'
                [['message'], 'message']
              else
                [['replied', 'quoted', 'unfollowed', 'followed'], 'notification']
              end

    notifications = recipient.notifications.unread.in(action: actions)
    html = notifications.inject('') do |html, notif|
      html += ApplicationController.render partial: "notifications/#{notif.notifiable_type.underscore.pluralize}/#{notif.action}", locals: { notification: notif }, formats:[:html]
    end

    NotificationsChannel.broadcast_to recipient.id, html: html, count: notifications.count, action_type: action_type
  end

  def self.unread
    where(read: false)
  end
end

