class SignaturesController < ApplicationController
	before_action :require_ownership, only: [:destroy]

	def create
		Signature.create(signature_params)

		redirect_to petition_path(signature_params[:petition_id])
	end

	def destroy
		@petition = @signature.petition
		@signature.destroy
		redirect_to petition_path(@petition), notice: "You signature has been removed."
	end

	private

	def signature_params
		params.require(:signature).permit(:anonymous, :message, :user_id, :petition_id)
	end

	def require_ownership
		@signature = Signature.find(params[:id])
		redirect_to dashboard_path unless current_user == @signature.user
	end
end
