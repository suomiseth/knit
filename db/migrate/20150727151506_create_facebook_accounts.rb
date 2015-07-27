class CreateFacebookAccounts < ActiveRecord::Migration
  def change
    create_table :facebook_accounts do |t|
      t.integer :person_id
      t.string :handle

      t.timestamps null: false
    end
  end
end
