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
#  created_on        :date
#  update_on         :date
#  created_at        :datetime
#  updated_at        :datetime
#  company_name      :string(255)
#  url               :string(255)
#  email             :string(255)
#  lower_bound       :integer
#  higher_bound      :integer
#  token             :string(255)
#  is_published      :boolean
#

class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, :counter_cache => true

  scope :published,  -> { where(:is_published => true ) }

  include Tokenable

  validates :title, :presence => true

  validates :lower_bound, presence: true
  #validates :higher_bound, presence: true

  def publish!
    self.is_published = true
    self.save
  end
end
