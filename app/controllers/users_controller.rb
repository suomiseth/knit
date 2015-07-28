class UsersController < ApplicationController

  def index
    # @instagram = Instagram.user_recent_media("49493754", {:count => 1})
  end

  def show
    @tweets = TwitterConnection.new(current_user).get_tweets
  end

  def settings
  end
end