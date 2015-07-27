
Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :instagram, ENV['INSTAGRAM_CLIENT_ID'], ENV['INSTAGRAM_SECRET']
end