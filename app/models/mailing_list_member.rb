class MailingListMember
  include ActiveModel::Validations

  validates_presence_of :name, :address
  attr_accessor :id, :mailing_list_address, :address, :name, :subscribed 
 

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end
 
  def read_attribute_for_validation(key)
    instance_variable_get("@#{key}")
  end
 
  def to_key

  end

  def save

    if self.valid?
      mailgun.list_members(mailing_list_address).add(address,
        :name => name,
        :subscribed => subscribed,
        :upsert => true
      )

    end
  end

  def subscribed?
    subscribed == true || subscribed == "yes" 
  end

  def self.find(mailing_list_address, address)
    begin
      member = mailgun.list_members(mailing_list_address).find(address)["member"]
    rescue => e
      member = {}
    end

    return self.new({
      :mailing_list_address => mailing_list_address,
      :name => member["name"],
      :address => member["address"],
      :subscribed => member["subscribed"]
    })
  end


  private


  def self.mailgun
    Mailgun()
  end

  def mailgun
    Mailgun()
  end


end