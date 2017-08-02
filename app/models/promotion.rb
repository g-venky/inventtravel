class Promotion < ApplicationRecord
	belongs_to :user
	has_many :usefuls
end
