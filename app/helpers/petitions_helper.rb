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

	def display_excerpt(petition, num_sentences=3)
		# needs work
		# petition.excerpt << (link_to("[read more]", petition_path(petition)))
		petition.description.split(". ")[0..num_sentences].join + " [...]"
	end

	def display_petition_count
		Petition.count
	end
end
