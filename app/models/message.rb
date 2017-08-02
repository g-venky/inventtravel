class Message < ApplicationRecord
  belongs_to :conversations
  belongs_to :user# :inverse_of => :message
 #validates_presence_of :body, :conversation_id, :user_id
end
