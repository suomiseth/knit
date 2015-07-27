class SessionsController < ApplicationController

  def create
    # binding.pry
    @user = User.find_or_create_from_auth_hash(auth_hash)

    @user = session[:user_id] = @user.id
    redirect_to root_path
    
  end 



  protected
  def auth_hash
    request.env['omniauth.auth']
  end

end