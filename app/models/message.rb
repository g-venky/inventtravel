class Message < ApplicationRecord
	belongs_to :conversation
  #belongs_to :user, :inverse_of => :message
 # validates_presence_of :body, :conversation_id, :user_id
end
