class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  def active_posts
    posts.where(status: 1)
  end

end
