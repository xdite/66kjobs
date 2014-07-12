namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed", "dev:demo" ]

  desc "create_base_category"
  task :demo => :environment do
    Category.create!(:name => "視覺設計")
    Category.create!(:name => "程式設計")
    Category.create!(:name => "網路行銷")
    Category.create!(:name => "市場開發 / 業務")
    Category.create!(:name => "網站內容編輯")
    Category.create!(:name => "行銷 / 企劃")
  end

  task :fake => :environment do 
    
  end
end