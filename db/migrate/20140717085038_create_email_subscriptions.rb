class CreateEmailSubscriptions < ActiveRecord::Migration
  def change
    create_table :email_subscriptions do |t|
      t.string :name
      t.string :email
      t.string :token
      t.timestamps
    end

    add_index :email_subscriptions, :token 
    
  end
end
