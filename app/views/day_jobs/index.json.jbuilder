json.array!(@day_jobs) do |day_job|
  json.extract! day_job, :id, :title, :description
  json.url day_job_url(day_job, format: :json)
end
