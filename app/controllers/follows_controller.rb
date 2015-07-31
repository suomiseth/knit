class FollowsController < ApplicationController

  def method_name
    
  end

  def destroy
    Follow.find(params['id']).destroy
    redirect_to user_path current_user
  end

end