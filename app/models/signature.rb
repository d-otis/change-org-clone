class Signature < ApplicationRecord
	belongs_to :user
	belongs_to :petition

	validates_uniqueness_of :user_id, :scope => :petition_id, :message => "You have already signed this petition!"

	def user_name
		self.user.name
	end

	# FOR ONE SIGNATURE PER PETITION VALIDATION
	# uid = 2
	# pid = 1
	# if Signature.where("user_id = ? and petition_id = ?", uid, pid) == 1
	# 	DONT render signature form 
	# end
	# ORRRRR
	# render signature_form unless has_signed?
end
