class InstagramConnection
  attr_reader :client

  def initialize(user)
    @client = Instagram.client(:access_token => user.instagram_auth_token)
  end
  # is a knit users instagram feed 
  def media_feed
    @client.user_media_feed
  end  
  # selects 10 posts from knit instagram user feed
  def select_post
    ten = media_feed[0..10]
    return ten_images(ten)
  end  
  # selects just the images from those users in that feed
  def ten_images(ten)
   ten.map{|x| x[:images][:low_resolution][:url]}
  end
  #returns in an array of hashes of the people you're following on instagram
  def get_following
   @client.user_follows(id = nil, options = {:count => 100})
   binding.pry
  end
  #returns an individual person you're following on instagram
  def get_specific_user_posts(id)
   @client.user_recent_media(id)
  end

  def search_for_user(handle)
    @client.user_search(handle)
  end


  def return_person_posts(person)
    following = get_following
    id = nil
    following.each do |hash|
      if hash.username == person.instagram_handle
        id = hash.id
      end
    end
    return id
  end







  # get the token
  # auth_hash["credentials"]["token"]


  # @user = User.find_or_create_from_auth_hash(auth_hash)

  # @user = session[:user_id] = @user.id
  # # auth_hash["uid"]
  
  # # @client.user_follows pulls up all users that the current user follows.
  # # @client.user_follows
  # @media_feed = @client.user_media_feed
  # # array
  # ten[9][:images][:low_resolution][:url]
end

# x = @client.user_recent_media(1244141357)
# image = ten_images(x)