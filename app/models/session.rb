class Session < ApplicationRecord
	belongs_to :user, optional: true
  belongs_to :conversation, optional: true
end
