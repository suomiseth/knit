class User < ActiveRecord::Base
  belongs_to :person
  has_many :follows, class_name: "Follow", foreign_key: :follower_id
  has_many :followees, through: :follows
end
