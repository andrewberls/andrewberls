class AddPostStatus < ActiveRecord::Migration
  def up
    add_column :posts, :status, :integer
  end

  def down
    remove_column :posts, :status
  end
end
