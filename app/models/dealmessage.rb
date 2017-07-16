class Dealmessage < ApplicationRecord
	belongs_to :deal
  belongs_to :user
  has_many :replies
end
