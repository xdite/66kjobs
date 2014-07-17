# == Schema Information
#
# Table name: jobs
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :text
#  user_id            :integer
#  category_id        :integer          default(1)
#  location           :string(255)
#  apply_instruction  :text
#  created_on         :date
#  updated_on         :date
#  created_at         :datetime
#  updated_at         :datetime
#  company_name       :string(255)
#  url                :string(255)
#  email              :string(255)
#  lower_bound        :integer
#  higher_bound       :integer
#  token              :string(255)
#  is_published       :boolean
#  ip                 :string(30)
#  email_confirmed    :boolean          default(FALSE)
#  email_confirmed_at :datetime
#

class Job < ActiveRecord::Base


  belongs_to :user
  belongs_to :category, :counter_cache => true

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
    ERB::Util.h("#{title} - #{company_name} - 最高薪水 #{higher_bound}")
  end



  def check_salary
    if lower_bound.blank?
      errors.add(:lower_bound, "最低薪水不能為空")
    end

    if higher_bound.blank?
      errors.add(:lower_bound, "最高薪水不能為空")
    end

    if lower_bound.to_i < 30000
      errors.add(:lower_bound, "最低薪不能低於 30000")
    end

    if higher_bound.to_i < 60000
      errors.add(:lower_bound, "最高薪要超過 66000")
    end

    if lower_bound.to_i > higher_bound.to_i
      errors.add(:lower_bound, "最高薪要能超過最低薪")
    end

  end

end
