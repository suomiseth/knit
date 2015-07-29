class FacebookConnection
  attr_reader :client
  attr_reader :user

  def initialize(user)
    @client ||= Koala::Facebook::API.new(user.facebook_auth_token)
    @user = user
  end

  def posts
    # not sure if the "me" message here works for other people
    @client.get_object("me/posts")
  end

  def followees_posts
    ##### this is a temporary way of doing this, the regular way is commented out.... 
    ##### until we have followees built in
    ##### the real method should return a nested array of each followee's posts"
    # @user.followees.map do |followee|
      # @client.get_object("#{followee.facebook_uid}/posts")
    # end
    @followee_posts = @client.get_object("me/friends").map do |followee|
      @client.get_object("#{followee['id']}/posts")
    end
  end

  #this would be better to pass a single post and return a single array
  def post_urls
    @posts = posts
    @posts["posts"]["data"].map do |post|
      ids = post["id"].split("_")
      "https://facebook.com/#{ids[0]}/posts/#{ids[1]}"
    end
  end

  def followee_posts_urls
    @followees_posts.flatten.map do |followee_posts|
    end
  end

  def get_following
    @client.get_object("me/friends")
  end
end