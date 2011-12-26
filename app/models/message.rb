class Message

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :message

  validates :name, :email, :message, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true
  
  # This code is copied from http://matharvard.ca/posts/2011/aug/22/contact-form-in-rails-3/  
  # Both of these methods are necessary, but I don't know what calls them,
  # or why they exist.
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end


end