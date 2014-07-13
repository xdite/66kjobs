class AddIpDetectToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :ip, :string, :limit => 30
  end
end
