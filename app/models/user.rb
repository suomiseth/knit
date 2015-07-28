class User < ActiveRecord::Base
  belongs_to :person
  has_many :follows, class_name: "Follow", foreign_key: :follower_id
  has_many :followees, through: :follows

  def self.find_or_create_from_auth_hash(auth_hash)
    if User.find_by(:name => auth_hash[:info][:name])
     @user = User.find_by(:name => auth_hash[:info][:name])
     @user.auth_token = auth_hash["credentials"]["token"]
    else
      @user = create! do |user|
        user.provider = auth_hash["provider"]
        user.uid = auth_hash["uid"]
        user.name = auth_hash["info"]["name"]
        user.auth_token = auth_hash["credentials"]["token"]
      end
    end
    @user
  end
end
