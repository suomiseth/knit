class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    # maybe forward this to login method in application controller
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end 

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end