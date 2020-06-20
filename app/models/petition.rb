class Petition < ApplicationRecord
	belongs_to :author, 
			   :class_name => "User"
	has_many :signatures
			 :dependent => :destroy
	has_many :signers,
			 :through => :signatures,
			 :source => :user,
			 :foreign_key => :user_id
end
