class Reply < ApplicationRecord
	belongs_to :deal_message
  belongs_to :user
  belongs_to :quote
end
