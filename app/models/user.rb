class User < ApplicationRecord
	has_many :authored_petitions, 
			 :class_name => "Petition", 
			 :foreign_key => :author_id
	has_many :signatures
end
