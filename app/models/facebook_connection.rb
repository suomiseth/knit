class FacebookConnection

  def initialize(oauth_token)
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

end
