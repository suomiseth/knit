class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :photo_url
      t.string :instagram_handle
      t.string :twitter_handle
      t.string :facebook_handle
      t.string :instagram_uid
      t.string :twitter_uid
      t.string :facebook_uid
      
      t.timestamps null: false
    end
  end
end
