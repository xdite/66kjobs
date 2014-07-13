class AddUserIsAdmin < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :false
  end
end
