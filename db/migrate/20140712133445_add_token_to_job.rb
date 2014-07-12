class AddTokenToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :token, :string
    add_column :jobs, :is_published, :boolean, :defalt => false
  end
end
