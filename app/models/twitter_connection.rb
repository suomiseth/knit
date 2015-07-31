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
    @user.followees.map do |followee|
      followee.twitter_handle
    end
  end

  def get_uid
    get_handles.map do |handle|
        if handle != ""
          client.user(handle).id
        end
    end
  end

  def get_tweets
    get_handles.compact.map do |handle|
      if handle != nil && handle != ''
        client.user_timeline(handle, count: 5)
      end
    end
  end

  def twitter_connect
    tweet_array = []
    get_tweets.flatten.each do |tweet|
    tweet_hash = {}
      tweet_hash[:handle] = tweet.user.screen_name
      tweet_hash[:uri] = tweet.uri.to_s
      tweet_hash[:photo_uri] = tweet.media[0].media_url.to_s if(tweet.media.present?)
      tweet_hash[:text] = tweet.text
      tweet_hash[:post_time] = tweet.created_at
      tweet_hash[:source] = "twitter"
      tweet_array << tweet_hash
    end
    tweet_array
  end

end




