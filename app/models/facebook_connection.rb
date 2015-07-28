class FacebookConnection
  attr_reader :client

  def initialize(user)
    @client ||= Koala::Facebook::API.new(user.facebook_auth_token)
  end

  def posts
    # not sure if the "me" message here works for other people
    @client.get_object("me?fields=posts")
  end

  def post_urls
    @posts = posts
    # binding.pry
    @posts["posts"]["data"].map do |post|
      ids = post["id"].split("_")
      "https://facebook.com/#{ids[0]}/posts/#{ids[1]}"
    end
  end

end
