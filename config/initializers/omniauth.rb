
Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], {scope: "email, user_posts, user_friends"}
end

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'], ENV['TWITTER_ACCESS_TOKEN'], ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :instagram, ENV['INSTAGRAM_CLIENT_ID'], ENV['INSTAGRAM_SECRET']
end