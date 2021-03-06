class SessionsController < ApplicationController
  skip_before_filter :logged_in_check
  skip_before_filter :has_community?
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to liveboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
