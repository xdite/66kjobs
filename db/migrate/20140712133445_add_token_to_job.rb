class AddTokenToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :lower_bound, :integer
    add_column :jobs, :higher_bound, :integer
    add_column :jobs, :token, :string
    add_column :jobs, :is_published, :boolean, :defalt => false
    add_index :jobs, :token
    add_index :jobs, :is_published
  end
end
