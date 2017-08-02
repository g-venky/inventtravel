class Topic < ApplicationRecord
	#belongs_to :discussions
	has_many :comments, dependent: :destroy
	validates :discussion, presence: true,
                    length: { minimum: 5 }
end
