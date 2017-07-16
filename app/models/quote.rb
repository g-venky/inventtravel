class Quote < ApplicationRecord
	belongs_to :query
  belongs_to :user
  has_many :replies
end
