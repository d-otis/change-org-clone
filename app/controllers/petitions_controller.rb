class PetitionsController < ApplicationController
	before_action :set_petition, only: [:show, :edit, :update, :destroy]
	before_action :require_login
	before_action :require_auth, only: [:edit, :destroy, :update]
	skip_before_action :require_login, only: [:index, :show]

	def index
		if params[:user_id]
			if User.find_by(id: params[:user_id])
				@petitions = Petition.where(author: params[:user_id])
				redirect_to user_path(params[:user_id]), notice: "Petition(s) not found" if @petitions.empty?
			else
				redirect_to petitions_path, notice: "User not found."
			end
		else
			@petitions = Petition.all
		end
	end

	def show
		# check if the user exists
		# check if the petition exists and that it belongs to user
		@user = User.find_by(id: params[:user_id])
		if @user.nil?
			redirect_to petitions_path, notice: "User not found."
		elsif @petition.nil? || @petition.author != @user
			redirect_to petitions_path, notice: "Petition Not Found"
		else
			@signature = Signature.new
		end
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
		@petition.destroy
		redirect_to dashboard_path, notice: "You have deleted your petition."
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
