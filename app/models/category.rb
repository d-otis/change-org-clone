class Category < ApplicationRecord
  has_many :petitions 

  def petition_count
  	self.petitions.count
  end 
end