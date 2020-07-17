class Category < ApplicationRecord
  has_many :petitions

  validates :title, :presence => true

  def petition_count
  	self.petitions.count
  end 
end