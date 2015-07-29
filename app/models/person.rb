class Person < ActiveRecord::Base
  has_many :follows, class_name: "Follow", foreign_key: :followee_id
  has_many :followers, through: :follows

end
