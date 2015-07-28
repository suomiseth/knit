class InstagramConnection
  attr_reader :client

  def initialize(token)

    # GETTING THE INSTAGRAM AUTH TOKEN
    @client = Instagram.client(token)


  end

  # get the token
  # auth_hash["credentials"]["token"]


  # @user = User.find_or_create_from_auth_hash(auth_hash)

  # @user = session[:user_id] = @user.id
  # # auth_hash["uid"]
  
  # # @client.user_follows pulls up all users that the current user follows.
  # # @client.user_follows
  # @media_feed = @client.user_media_feed
  # # array

end