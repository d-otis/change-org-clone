module PetitionsHelper
	def display_date(date_time)
		date_time.strftime("%b %e, %l:%M %p")
	end

	def display_signer_name(signature)
		signature.anonymous ? "Anonymous" : signature.user_name
	end
end
