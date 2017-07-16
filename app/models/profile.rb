class Profile < ApplicationRecord
	belongs_to :user
	#validates :organization, :designation , presence: true, on: :create

  #validate :any_travel_segment?, on: :create
  #validate :any_deal?, on: :create

  def protocol_website
    unless self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//]
      self.website = "http://#{self.website}"
    end
  end

  def tagline
    res = ""
    unless self.designation == ""
      res += self.designation
    end
    
    unless self.organization == ""
      res += " at #{self.organization}"
    end
    res
  end
end#
