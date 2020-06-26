class User < ApplicationRecord
	has_many :authored_petitions, 
			 :class_name => "Petition", 
			 :foreign_key => :author_id,
			 :dependent => :destroy
	has_many :signatures
	has_secure_password
	validates :name, :presence => true
	validates :email, :presence => true, :uniqueness => true

	validates :password, :presence => true, :confirmation => true, :on => :should_validate?
	validates_confirmation_of :password, :if => :should_validate?
	validates :password_confirmation, :presence => true, :if => :should_validate?

	private

	# should validate password and confirmation
	# if password is present OR it's a new record

	def should_validate?
		new_record? || password.present?
	end
end
