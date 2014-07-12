namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed", "dev:demo" ]

  desc "create_base_category"
  task :demo => :environment do
    for i in 1..10 do 
      Category.create!(:name => "Category #{i}")
    end
  end
end