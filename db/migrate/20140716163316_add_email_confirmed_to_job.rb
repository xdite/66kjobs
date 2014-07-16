class AddEmailConfirmedToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :email_confirmed, :boolean, :default => false
    add_column :jobs, :email_confirmed_at, :datetime
  end
end
