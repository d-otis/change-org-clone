class Petition < ApplicationRecord
	belongs_to :author, 
			   :class_name => "User"
	has_many :signatures,
			 :dependent => :destroy
	has_many :signers,
			 :through => :signatures,
			 :source => :user,
			 :foreign_key => :user_id

	accepts_nested_attributes_for :signatures

	def author_name
		self.author.name
	end
end
