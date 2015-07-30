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
    @instagram = InstagramConnection.new(@user) if @user.instagram_uid
    @posts = @instagram.select_post if @user.instagram_uid
    @tweets = TwitterConnection.new(@user).twitter_connect if @user.twitter_uid
    @instagram_follows = @instagram.get_following if @user.instagram_uid
    # @persons_insta_posts = @instagram.search_for_user(@person)
    @instagram_posts = @instagram.get_post_details(@user) 


    @tweets = TwitterConnection.new(@user).get_tweets if @user.twitter_uid
    
    @facebook_posts = FacebookConnection.new(@user).post_urls if @user.facebook_uid
  end

  def edit
    
  end

  def settings

  end
  
end