class SignaturesController < ApplicationController

	def create
		Signature.create(signature_params)

		redirect_to petition_path(signature_params[:petition_id])
	end

	private

	def signature_params
		params.require(:signature).permit(:anonymous, :message, :user_id, :petition_id)
	end
end
