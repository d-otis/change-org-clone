class PetitionsController < ApplicationController
	before_action :set_petition, only: [:show, :edit, :update, :destroy]
	before_action :require_login
	before_action :require_auth, only: [:edit, :destroy, :update]
	skip_before_action :require_login, only: [:index, :show]

	def index
		@petitions = Petition.all
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
		binding.pry
	end

	private

	def petition_params
		params.require(:petition).permit(:title, :description, :goal, :author_id)
	end

	def require_login
		redirect_to "/signin", notice: "You must be signed in to do that." unless logged_in?
	end

	def set_petition
		@petition = Petition.find_by(id: params[:id])
	end

	def require_auth
		redirect_to petition_path(@petition), notice: "You can only edit your own petitions!" unless @petition.author == current_user
	end
end
