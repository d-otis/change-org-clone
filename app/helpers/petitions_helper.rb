module PetitionsHelper
	def display_date(date)
		date.strftime("%b %e, %l:%M %p")
	end

	def display_signer_name(signature)
		signature.anonymous ? "Anonymous" : signature.user_name
	end

	def display_message(signature)
		"#{signature.message.strip.capitalize}" if signature.message.present?
	end

	def has_signed?(petition)
		if Signature.where("user_id = ? and petition_id = ?", current_user.id, petition.id).count >= 1
			true
		else
			false
		end
	end

	def is_author?(petition)
		petition.author == current_user
	end
end
