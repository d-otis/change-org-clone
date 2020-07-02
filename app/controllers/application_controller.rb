class ApplicationController < ActionController::Base
	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		!!current_user
	end

	def login_user(user)
	  session[:user_id] = user.id
	end
end
