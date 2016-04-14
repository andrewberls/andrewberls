class AddPublishedAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_at, :timestamp
    Post.all.each do |post|
      post.published_at = post.created_at
      post.save!
    end
  end
end
