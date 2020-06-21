class Signature < ApplicationRecord
	belongs_to :user
	belongs_to :petition

	def user_name
		self.user.name
	end
end
