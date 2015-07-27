class Person < ActiveRecord::Base
  has_many :follows, class_name: "Follow", foreign_key: :followee_id
  has_many :followers, through: :follows
  has_one :twitter_account
  has_one :facebook_account
  has_one :instagram_account
end
