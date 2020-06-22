class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if current_user
  end

  def create
  	@user = User.find_by(email: user_params[:email])
  	if @user && @user.authenticate(user_params[:password])
  		session[:user_id] = @user.id
  		redirect_to user_path(@user)
  	else
  		redirect_to '/signin', notice: @user.errors
  	end
  end

  def destroy
      reset_session
      redirect_to "/signin"
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password)
  end
end
