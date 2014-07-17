class Subscription
  include ActiveModel::Model

  attr_accessor(
    :email,
    :name,
  )

  validates :email, presence: true
  validates :name, presence: true
  validates :email, :email => true

  def register
    if valid?
      subscribe_to!("newspaper@66kjobs.tw")
    end
  end


  def subscribe_to!(mailing_list_address)
    user = self

    @member = MailingListMember.new
    @member.mailing_list_address = mailing_list_address
    @member.address = email
    @member.name = name
    @member.subscribed = "yes"
    @member.save

  end

end