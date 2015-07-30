class FacebookConnection
  attr_reader :client
  attr_reader :user

  def initialize(user)
    @client ||= Koala::Facebook::API.new(user.facebook_auth_token)
    @user = user
  end

  def posts
    @client.get_object("me/posts")
  end

  def followees_posts
    @user.followees.map do |followee|
      followee.facebook_uid || followee.update(facebook_uid: find_followee_uid(followee))
      @client.get_object("#{followee.facebook_uid}/posts")
    end.flatten
  end

  #this would be better to pass a single post and return a single array
  def post_urls
    posts = followees_posts
    posts.map do |post|
      ids = post["id"].split("_")
      "https://facebook.com/#{ids[0]}/posts/#{ids[1]}"
    end
  end

  def get_following
    @client.get_object("me/friends")
  end

  def find_followee_uid(followee)
    match = get_following.find {|person| person["name"] == followee.facebook_handle}
    match["id"]
  end
end