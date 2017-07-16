class Deal < ApplicationRecord
 # has_many :usefuls
 # has_many :deal_messages
 # belongs_to :user, :inverse_of => :deal
 # has_many :notifications, as: :notifiable
 belongs_to :company
  
end
