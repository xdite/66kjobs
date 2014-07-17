namespace :newspaper do

  desc "sending newspaper"
  task :send_job_digest => :environment do
    JobMailer.job_list_summary(Setting.newspaper_email).deliver
  end
end