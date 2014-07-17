module PublishConcern
  extend ActiveSupport::Concern


  def verified?
    email_confirmed_at.present? && email_confirmed
  end

  def verify!
    self.email_confirmed_at = Time.now
    self.email_confirmed = true
    self.save
  end

  def publish!
    self.is_published = true
    self.save
  end

end
