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
      @posts = @instagram.select_post if @user.instagram_uid
      @instagram_follows = @instagram.get_following
    end

    if @user.twitter_uid
      @tweets = TwitterConnection.new(@user).get_tweets
    end

    if @user.facebook_uid
      @facebook_posts = FacebookConnection.new(@user).followees_posts 
      @fb_followee_posts_urls = FacebookConnection.new(@user).post_urls
    end
  end

  def edit
  end

  def settings
  end
  
end