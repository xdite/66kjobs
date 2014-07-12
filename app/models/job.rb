# == Schema Information
#
# Table name: jobs
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  company_name :string(255)
#  url          :string(255)
#  email        :string(255)
#  category_id  :integer
#

class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
end
