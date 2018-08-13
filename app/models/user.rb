# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  full_name     :string(255)
#  permissions   :integer
#

class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy

  has_secure_password

  validates :full_name, presence: true, length: { maximum: 50 }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  validates :password, presence: { on: :update },
                       length: { minimum: 5 }, if: :password_digest_changed?

  def is_admin?
    permissions == 0
  end

  def is_developer?
    permissions == 1
  end

  def is_author?
    permissions == 2
  end

  def permission_str
    # Return the permission string associated with the users permission number.

    case self[:permissions]
      when 0 then 'Adminstrator'
      when 1 then 'Developer'
      when 2 then 'Author'
    end
  end
end
