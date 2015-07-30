class FacebookConnection
  attr_reader :client
  attr_reader :user

  def initialize(user)
    @client ||= Koala::Facebook::API.new(user.facebook_auth_token)
    @user = user
  end

  def get_posts
    @user.followees.map do |followee|
      followee.facebook_uid || followee.update(facebook_uid: find_followee_uid(followee))
      get_followee_posts(followee)
    end.flatten
  end

  def find_followee_uid(followee)
    match = get_following.find {|person| person["name"] == followee.facebook_handle}
    match["id"]
  end
  
  def get_followee_posts(followee)
    posts = @client.get_object("#{followee.facebook_uid}/posts?fields=id, created_time, message, name, picture")
    posts.map do |post|
      {
        handle: followee.facebook_handle,
        uri: post_url(post),
        photo_uri: post['picture'],
        text: post['message'],
        post_time: post['created_time'].split("T").join(" "),
        source: "facebook"
      }
    end
  end

  def post_url(post)
      ids = post["id"].split("_")
      "https://facebook.com/#{ids[0]}/posts/#{ids[1]}"
  end

  # # this would be used for searching for matched users when adding--not used now
  # def get_following
    # @client.get_object("me/friends")
  # end
end