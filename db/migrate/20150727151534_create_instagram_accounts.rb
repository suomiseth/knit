class CreateInstagramAccounts < ActiveRecord::Migration
  def change
    create_table :instagram_accounts do |t|
      t.integer :person_id
      t.string :handle
      
      t.timestamps null: false
    end
  end
end
