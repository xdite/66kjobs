class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :jobs_count, :default => 0
      t.timestamps
    end

  end
end
