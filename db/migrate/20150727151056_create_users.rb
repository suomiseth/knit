class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :provider
      t.string :photo_url
      t.integer :person_id
      t.string :auth_token

      t.timestamps null: false
    end
  end
end
