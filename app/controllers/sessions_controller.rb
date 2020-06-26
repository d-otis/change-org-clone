class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if current_user
  end

  def create
    if auth
      @user = User.find_or_create_by(email: auth['info']['email']) do |u|
        u.password = generate_password
        u.name = auth['info']['name']
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user) and return
    else
      @user = User.find_by(email: user_params[:email])
      if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user) and return
      else
        redirect_to '/signin', notice: "Incorrect credentials."
      end
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

  def auth
    request.env['omniauth.auth']
  end

  def generate_password
    salt = BCrypt::Engine::generate_salt
    hash = BCrypt::Engine::hash_secret(salt, salt)
  end
end
