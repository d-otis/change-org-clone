class SignaturesController < ApplicationController

	def create
		binding.pry
	end

	private

	def signature_params
		params.require(:signature).permit(:anonymous, :message, :user_id)
	end
end
