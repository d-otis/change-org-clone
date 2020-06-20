class Petition < ApplicationRecord
	belongs_to :author, :class_name => "User"
	has_many :signatures
	has_many :signers,
			 :through => :signatures,
			 :source => :user,
			 :foreign_key => :user_id
end
