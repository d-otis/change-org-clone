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

	def goal_percent
		((self.signatures.count.to_f / self.goal.to_f) * 100).round
	end

	def signature_count
		self.signatures.count
	end

	def signatures_desc
		self.signatures.order(:created_at => :desc).first(5)
	end
end
