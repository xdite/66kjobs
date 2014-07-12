class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :category_id , :default => 1
      t.string :location
      t.text :apply_instruction
      t.date :created_on
      t.date :update_on
      t.timestamps
    end
  end
end
