class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash, current_user)
    session[:user_id] = @user.id
    if (@user.facebook_uid && @user.twitter_uid && @user.instagram_uid)
      redirect_to user_path(@user.id)
    else
      redirect_to edit_user_path(@user)
    end
  end 

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end