class User < ApplicationRecord
	has_many :authored_petitions, 
			 :class_name => "Petition", 
			 :foreign_key => :author_id
	has_many :signatures
	has_secure_password
	validates :name, :presence => true
	validates :email, :presence => true, :uniqueness => true
	validates :password, :presence => true, :confirmation => true
	validates_confirmation_of :password
	validates :password_confirmation, :presence => true
end
