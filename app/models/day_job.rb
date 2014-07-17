# == Schema Information
#
# Table name: day_jobs
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :text
#  location           :string(255)
#  apply_instruction  :text
#  created_on         :date
#  updated_on         :date
#  company_name       :string(255)
#  url                :string(255)
#  email              :string(255)
#  lower_bound        :integer
#  higher_bound       :integer
#  token              :string(255)
#  is_published       :boolean          default(FALSE)
#  ip                 :string(255)
#  email_confirmed    :boolean
#  email_confirmed_at :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

class DayJob < ActiveRecord::Base

  scope :published,  -> { where(:is_published => true ).where(:email_confirmed => true ) }
  scope :recent, -> { order("id DESC") }

  include Tokenable
  include OpenGraphable
  include PublishConcern
  include ActionView::Helpers::TextHelper

  validates :title, :presence => true
  validates :description, :presence => true
  validates :location, :presence => true
  validates :apply_instruction, :presence => true
  validates :url, :url => true, :allow_blank => true
  validates :email, :email => true

  validate :check_salary, fields: [:lower_bound, :higher_bound]

  def og_title
    ERB::Util.h("（日薪專區）#{title} - #{company_name} - 最高日薪 #{higher_bound}")
  end



  def check_salary
  end
end
