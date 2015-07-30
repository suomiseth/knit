class PeopleController < ApplicationController

  def create
    @person = Person.new
    @person.instagram_handle = params[:person][:instagram_handle]
    @person.twitter_handle = params[:person][:twitter_handle]
    @person.facebook_handle = params[:person][:facebook_handle]
    @person.save

    @instagram = InstagramConnection.new(current_user)
    id = @instagram.return_person_posts(@person)
    @person.instagram_uid = id
    @person.save

    Follow.create(:follower_id => current_user.id, :followee_id => @person.id)
    redirect_to user_path current_user
  end
end
