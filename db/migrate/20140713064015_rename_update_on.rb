class RenameUpdateOn < ActiveRecord::Migration
  def change
    rename_column :jobs, :update_on, :updated_on
  end
end
