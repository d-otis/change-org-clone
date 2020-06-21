module PetitionsHelper
	def display_date(date_time)
		date_time.strftime("%b %e, %l:%M %p")
	end
end
