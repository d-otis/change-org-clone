class SignaturesController < ApplicationController

	def create

	end

	private

	def signature_params
		params.require(:signature).permit(:anonymous, :message, :user_id, :petition_id)
	end
end
