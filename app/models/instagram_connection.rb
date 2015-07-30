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
    return get_images(ten)
  end  
  # selects just the images from those users in that feed
  def get_images(ten)
   return ten.map{|x| x[:images][:low_resolution][:url]}
  end
  #returns in an array of hashes of the people you're following on instagram
  def get_following
   @client.user_follows(id = nil, options = {:count => 100})
  end

  #returns an individual person you're following on instagram
  def get_specific_user_posts(id)
   @client.user_recent_media(id)
  end


  # searches instagram for a specific username
  def search_for_user(person)
    result = @client.user_search(person.instagram_handle)
    person.instagram_uid = result[0].id
    person.instagram_handle = result[0].username
    person.name = result[0].full_name
    person.save
  end



  def get_post_details(user)
    # we have a current user. we want to find all followees posts.
    # and construct hash for each folowee
    all_posts = user.followees.map do |folowee|
      get_specific_user_posts(folowee.instagram_uid)
    end
    y = nested_arrays_to_hash(all_posts)
  end #end get_post_details



  def nested_arrays_to_hash(posts_array)
    # goes through posts_array where each index is an individual Person

    return_array = []

      posts_array.each do |bunch_of_posts|
      
       # goes through each PERSONS posts.
      bunch_of_posts.each do |post|
        return_hash = {}
        return_hash[:handle] = post[:user][:username]
        return_hash[:uri] = post[:link]
        return_hash[:photo_uri] = post[:images][:low_resolution][:url]
        if post[:caption]
          return_hash[:text] = post[:caption][:text] 
        end
        return_hash[:post_time] = Time.at(post[:created_time].to_i)
        return_hash[:source] = "instagram"
        return_array << return_hash
      end
    end
    return_array
  end



  def followees_posts
   @user.followees.map do |followee|
     followee.facebook_uid || followee.update(facebook_uid: find_followee_uid(followee))
     @client.get_object("#{followee.facebook_uid}/posts")
   end.flatten
  end

  # gives us the posts of a specific user when sending their instagram UID in.
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

end






# def find_followee_uid(followee)
#    match = get_following.find {|person| person["name"] == followee.facebook_handle}
#    match["id"]
# end