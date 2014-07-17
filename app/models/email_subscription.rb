# == Schema Information
#
# Table name: email_subscriptions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  token      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class EmailSubscription < ActiveRecord::Base


  include Tokenable

  validates :email, presence: true
  validates :name, presence: true
  validates :email, :email => true
  
end
