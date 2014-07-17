every 2.day, :at => '01:30 pm' do
  rake "newspaper:send_job_digest"
end