xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "66K 工作網 - #{@category.name} "
    xml.description "66K 工作網 - #{@category.name} 職缺"
    xml.link root_url

    @jobs.each do |job|
      xml.item do
        xml.title job.title
        xml.description render_job_description(job)
        xml.pubDate job.created_at.to_s(:rfc822)
        xml.author job.company_name
        xml.link job_url(job)
        xml.guid job_url(job)
      end
    end
  end
end