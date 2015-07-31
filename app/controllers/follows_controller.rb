class FollowsController < ApplicationController

  def destroy
    Follow.find(params['id']).destroy
    redirect_to user_path current_user
  end

end