# == Schema Information
#
# Table name: jobs
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  description       :text
#  user_id           :integer
#  category_id       :integer          default(1)
#  location          :string(255)
#  apply_instruction :text
#  created_at        :datetime
#  updated_at        :datetime
#  company_name      :string(255)
#  url               :string(255)
#  email             :string(255)
#  token             :string(255)
#

class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, :counter_cache => true


  include Tokenable


  def publish!
    self.is_published = true
    self.save
  end
end
