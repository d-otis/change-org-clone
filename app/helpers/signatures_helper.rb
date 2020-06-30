module SignaturesHelper
	def display_sig_usr(signature)
		signature.anonymous ? "Anonymous" : signature.user_name
	end

	def sig_usr_link(signature)
		if signature.anonymous
			#  don't show link
			content_tag(:span, "Anonymous",:class => 'badge badge-pill badge-danger')
		else
			# show link
			link_to signature.user_name, user_path(signature.user), :class => 'badge badge-pill badge-danger'
		end
	end
end
