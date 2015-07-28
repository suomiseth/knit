class UsersController < ApplicationController

  def index
    # @instagram = Instagram.user_recent_media("49493754", {:count => 1})
  end

  def create
    
  end

  def show
    @user = User.find(params[:id])
    @instagram = InstagramConnection.new(@user.auth_token)
    @posts = @instagram.select_post 
    @tweets = TwitterConnection.new(current_user).get_tweets

  end

  def settings
  end
  
end