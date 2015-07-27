class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      # this could be a little confusing because the follower_id is an alias for a user and the followee_id is the alias for a person.
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps null: false
    end
  end
end
