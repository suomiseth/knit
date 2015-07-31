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
    @posts = []
    if @user.instagram_uid
      @instagram = InstagramConnection.new(@user)
      @instagram_posts = @instagram.get_post_details(@user) 
      @posts += @instagram_posts
    end

    if @user.twitter_uid
      @tweets = TwitterConnection.new(@user).twitter_connect
      @posts += @tweets
    end

    if @user.facebook_uid
      @facebook_posts = FacebookConnection.new(@user).get_posts 
      @posts += @facebook_posts
    end
    @posts = @posts.sort_by{|post| post[:post_time] }.reverse.slice(0,20)
  end

  def edit
    @user = User.find(params[:id])
    @follows = @user.follows
  end

  def settings

  end
  
end