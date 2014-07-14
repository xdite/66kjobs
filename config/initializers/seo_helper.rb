SeoHelper.configure do |config|
  config.skip_blank               = false
  config.site_name = Setting.app_name
  config.default_page_description = "66K 工作網，提供 66K+ 優質好工作"
  config.default_page_image = "#{Setting.domain}#{Setting.default_og_url}"
end