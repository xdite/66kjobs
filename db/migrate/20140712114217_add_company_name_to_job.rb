class AddCompanyNameToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :company_name, :string
    add_column :jobs, :url , :string
    add_column :jobs, :email, :string
  end
end
