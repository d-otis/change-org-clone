module PetitionsHelper
	def display_date(date)
		date.strftime("%b %e, %l:%M %p")
	end

	def display_signer_name(signature)
		signature.anonymous ? "Anonymous" : signature.user_name
	end

	def display_message(signature)
		"#{signature.message.strip}" if signature.message.present?
	end
end
