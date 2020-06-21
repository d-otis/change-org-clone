class PetitionsController < ApplicationController
	before_action :set_petition, only: [:show, :edit, :update, :destroy]
	before_action :require_login
	skip_before_action :require_login, only: [:index, :show]

	def index
	end

	def show
		@signature = Signature.new
	end

	def edit
	end

	def update
		@petition.update(petition_params)
		redirect_to petition_path(@petition), notice: "You have updated your petition!"
	end

	def new
		@petition = Petition.new
	end

	def create
		@petition = Petition.new(petition_params)
		
		if @petition.save
			redirect_to petition_path(@petition), notice: "You have created a new petition!"
		else
			render :new
		end
	end

	def destroy
	end

	private

	def petition_params
		params.require(:petition).permit(:title, :description, :goal, :author_id)
	end

	def require_login
		redirect_to "/signin", notice: "You must be signed in to do that." unless session[:user_id]
	end

	def set_petition
		@petition = Petition.find_by(id: params[:id])
	end
end
