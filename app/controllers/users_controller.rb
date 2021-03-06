class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show, :edit, :update, :destroy, :index]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user(@user)

      redirect_to dashboard_path, notice: "You have successfully created an account!"
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
    current_user.destroy
    reset_session
    redirect_to root_path, notice: "You have deleted your account."
  end

  def edit
  end

  def dashboard
    if current_user
      @user = current_user
    else
      redirect_to "/signin", notice: "You must be signed in to access the Dashboard."
    end
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_path, notice: "You've updated your account information."
    else
      flash[:notice] = @user.errors.full_messages
      render :edit
    end
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
