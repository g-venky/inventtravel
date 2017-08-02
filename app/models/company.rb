class Company < ApplicationRecord
	has_many :deals
	has_many :users
	has_many :queries
	has_many :usefuls
end
