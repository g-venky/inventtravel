class Comment < ApplicationRecord
	belongs_to :topic
	has_many :replies
end
