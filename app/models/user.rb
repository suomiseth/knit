class User < ActiveRecord::Base
  belongs_to :person
  has_many :follows, class_name: "Follow", foreign_key: :follower_id
  has_many :followees, through: :follows

  def self.find_or_create_from_auth_hash(auth_hash, user = nil)
    if user
      update_authorizations(auth_hash, user)
    else
      if auth_hash[:provider] == "twitter"
        if User.find_by(twitter_uid: auth_hash[:uid])
         @user = User.find_by(twitter_uid: auth_hash[:uid])
         @user.twitter_auth_token = auth_hash["credentials"]["token"]
        else
          @user = create! do |user|
            user.twitter_provider = auth_hash["provider"]
            user.twitter_uid = auth_hash["uid"]
            user.twitter_name = auth_hash["info"]["name"]
            user.twitter_auth_token = auth_hash["credentials"]["token"]
          end
        end
      elsif auth_hash[:provider] == "facebook"
        if User.find_by(facebook_uid: auth_hash[:uid])
         @user = User.find_by(facebook_uid: auth_hash[:uid])
         @user.facebook_auth_token = auth_hash["credentials"]["token"]
        else
          @user = create! do |user|
            user.facebook_provider = auth_hash["provider"]
            user.facebook_uid = auth_hash["uid"]
            user.facebook_name = auth_hash["info"]["name"]
            user.facebook_auth_token = auth_hash["credentials"]["token"]
          end
        end

      elsif auth_hash[:provider] == "instagram"
        if User.find_by(instagram_uid: auth_hash[:uid])
         @user = User.find_by(instagram_uid: auth_hash[:uid])
         @user.instagram_auth_token = auth_hash["credentials"]["token"]
        else
          @user = create! do |user|
            user.instagram_provider = auth_hash["provider"]
            user.instagram_uid = auth_hash["uid"]
            user.instagram_name = auth_hash["info"]["name"]
            user.instagram_auth_token = auth_hash["credentials"]["token"]
          end
        end
      else
      # throw an error
      "error"
      end
    end
  @user
  end


  def self.update_authorizations(auth_hash, user)
    @user = user
    if auth_hash[:provider] == "twitter"
      @user.twitter_provider = auth_hash["provider"]
      @user.twitter_uid = auth_hash["uid"]
      @user.twitter_name = auth_hash["info"]["name"]
      @user.twitter_auth_token = auth_hash["credentials"]["token"]
    elsif auth_hash[:provider] == "facebook"
      @user.facebook_provider = auth_hash["provider"]
      @user.facebook_uid = auth_hash["uid"]
      @user.facebook_name = auth_hash["info"]["name"]
      @user.facebook_auth_token = auth_hash["credentials"]["token"]
    elsif auth_hash[:provider] == "instagram"
      @user.instagram_provider = auth_hash["provider"]
      @user.instagram_uid = auth_hash["uid"]
      @user.instagram_name = auth_hash["info"]["name"]
      @user.instagram_auth_token = auth_hash["credentials"]["token"]
    else
      # throw an error
      "error"
    end
    @user.save
  end
end
