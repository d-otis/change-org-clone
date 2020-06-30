class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show, :edit, :update, :destroy, :index]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "You have successfully created an account!"
    else
      flash[:notice] = @user.errors.full_messages
      render :new
    end
  end

  def index
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def dashboard
    @user = current_user
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_login
    redirect_to petitions_path, notice: "You must be logged in to view user info." unless logged_in?
  end
end
