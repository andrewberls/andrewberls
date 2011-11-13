class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string "title", :default => "", :null => false
      t.string "body", :default => "", :null => false
      t.string "tags"
      t.timestamps
    end
  end
end
