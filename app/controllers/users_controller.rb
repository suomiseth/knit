class UsersController < ApplicationController

  def index
    # @instagram = Instagram.user_recent_media("49493754", {:count => 1})
  end

  def create
    
  end

  def show
    @user = User.find(params[:id])
    @instagram = InstagramConnection.new(@user) if @user.instagram_uid
    @posts = @instagram.select_post if @user.instagram_uid
    @tweets = TwitterConnection.new(@user).get_tweets if @user.twitter_uid
    @instagram_follows = @instagram.get_following
    @facebook_posts = FacebookConnection.new(@user).post_urls if @user.facebook_uid
  end

  def settings
  end
  
end