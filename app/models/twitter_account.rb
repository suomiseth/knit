class TwitterAccount < ActiveRecord::Base
  belongs_to :person

  twitter_connection = TwitterConnection.new


end
