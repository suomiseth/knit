class User < ActiveRecord::Base
  belongs_to :person
  has_many :follows, class_name: "Follow", foreign_key: :follower_id
  has_many :followees, through: :follows

  def self.find_or_create_from_auth_hash(auth_hash)
     if User.find_by(:name => auth_hash[:info][:name])
       User.find_by(:name => auth_hash[:info][:name])
     else
        create! do |user|
          user.provider = auth_hash["provider"]
          user.uid = auth_hash["uid"]
          user.name = auth_hash["info"]["name"]
        end
     end
  end




end
