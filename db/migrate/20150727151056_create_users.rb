class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :facebook_name
      t.string :facebook_uid
      t.string :facebook_provider
      t.string :facebook_auth_token
      t.string :twitter_name
      t.string :twitter_uid
      t.string :twitter_provider
      t.string :twitter_auth_token
      t.string :instagram_name
      t.string :instagram_uid
      t.string :instagram_provider
      t.string :instagram_auth_token
      t.string :photo_url
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
