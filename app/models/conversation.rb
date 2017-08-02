class Conversation < ApplicationRecord
	belongs_to :sender#, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient#, :foreign_key => :recipient_id, class_name: 'User'

  has_many :messages
  has_many :notifications, as: :notifiable

 # validates_uniqueness_of :sender_id, :scope => :recipient_id

  

  def self.find_between(sender_id, recipient_id)
    conve = self.where(sender_id: sender_id, recipient_id: recipient_id)
    conve2 = self.where(recipient_id: sender_id, sender_id: recipient_id)
    if (conve.first.nil? && conve2.first.nil?)
      return nil
    end

    if conve.first.present? && conve2.first.present?
      return self.where(sender_id: sender_id, recipient_id: recipient_id).or(recipient_id: sender_id, sender_id: recipient_id)
    elsif conve.first.present?
      return conve
    elsif conve2.first.present?
      return conve2
    else
      return nil
    end
    nil
  end

  scope :between, -> (sender_id, recipient_id) do
    conve = self.where(sender_id: sender_id, recipient_id: recipient_id)
    conve2 = self.where(recipient_id: sender_id, sender_id: recipient_id)
    if (conve.first.nil? && conve2.first.nil?)
      return nil
    end

    if conve.first.present? && conve2.first.present?
      return self.where(sender_id: sender_id, recipient_id: recipient_id).or(recipient_id: sender_id, sender_id: recipient_id)
    elsif conve.first.present?
      return conve
    elsif conve2.first.present?
      return conve2
    else
      return nil
    end
    nil
  end
end
