class UsersController < ApplicationController

  def index
    # @instagram = Instagram.user_recent_media("49493754", {:count => 1})
  end

  def create
    @user = User.new(user_name: params[:user][:user_name])
    render new_user_path
  end

  def show
    @user = User.find(params[:id])

    if @user.instagram_uid
      @instagram = InstagramConnection.new(@user)
      @instagram_posts = @instagram.get_post_details(@user) 
    end

    if @user.twitter_uid
      @tweets = TwitterConnection.new(@user).twitter_connect
    end

    if @user.facebook_uid
      @facebook_posts = FacebookConnection.new(@user).get_posts 
    end
  end

  def edit
  end

  def settings

  end
  
end