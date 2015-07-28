class InstagramAccount < ActiveRecord::Base
  belongs_to :person

    def initialize

      
      instagram_connection = InstagramConnection.new(token)
    end


end
