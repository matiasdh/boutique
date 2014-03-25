class Message

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :phone, :body

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone
  validates_presence_of :body

  validates_format_of :email, :with => /.+@.+\..+/i
  validates_length_of :body, :maximum => 500

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
