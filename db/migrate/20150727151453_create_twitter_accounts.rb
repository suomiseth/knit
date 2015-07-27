class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.integer :person_id
      t.string :handle
      
      t.timestamps null: false
    end
  end
end
