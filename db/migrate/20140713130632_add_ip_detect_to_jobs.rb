class AddIpDetectToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :ip, :string, :limit => 30
    add_index :jobs, :ip
    add_index :jobs, :created_on
    add_index :jobs, [:ip, :created_on]
  end
end
