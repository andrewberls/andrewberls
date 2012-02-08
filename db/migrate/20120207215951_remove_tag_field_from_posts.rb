class RemoveTagFieldFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :tags
  end

  def down
    add_column :posts, :tags, :string
  end
end
