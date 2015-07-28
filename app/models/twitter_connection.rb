class TwitterConnection 
  attr_reader :client

  def initialize
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
  
  def get_tweets
    tweets = client.user_timeline("mitchellhart")
    tweets.each do |tweet|
      tweet.text
    end
  end

end

