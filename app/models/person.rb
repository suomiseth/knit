class Person < ActiveRecord::Base
  has_many :follows, class_name: "Follow", foreign_key: :followee_id
  has_many :followers, through: :follows

 before_save :empty_to_nil

  def empty_to_nil
    attributes.each do |col, val|
      self[col] = nil if val.blank?
    end
  end
end
