class TwitterConnection 
  attr_reader :client

  def initialize(user)
    @user = user
    @client = create_client
  end

  def create_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

  def get_handles
    @user.followees.collect do |followee|
      followee.twitter_handle
    end
  end

  def get_uid
    get_handles.collect do |handle|
      client.user(handle).id
    end
  end

  def get_tweets
    get_uid.collect do |uid|
      client.user_timeline(uid.to_i, count: 10)
    end
  end

end



