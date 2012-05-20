class User < ActiveRecord::Base
  
  has_many :posts, :dependent => :destroy
  
  attr_accessible :full_name, :email, :password, :password_confirmation, :permissions
  attr_accessor :password, :password_confirmation
  before_save :encrypt_password # callback calls encrypt method before password is saved
    
  validates :full_name, presence: true, length: { maximum: 50 }
  
  validates :email, presence: true,                    
                    uniqueness: { case_sensitive: false }
    
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  
  def encrypt_password
    # Checks if password is present and generates hash and salt using BCrypt methods
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end