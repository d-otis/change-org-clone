class User < ApplicationRecord
	has_many :authored_petitions, 
			 :class_name => "Petition", 
			 :foreign_key => :author_id,
			 :dependent => :destroy
	has_many :signatures,
			 :dependent => :destroy

	has_secure_password

	validates :name, :presence => true
	validates :email, :presence => true, :uniqueness => true

	validates :password, :presence => true, :confirmation => true, :if => :should_validate?
	validates_confirmation_of :password, :if => :should_validate?
	validates :password_confirmation, :presence => true, :if => :should_validate?

	private

	def should_validate?
		new_record? || password.present? if !created_with_oauth
	end
end
