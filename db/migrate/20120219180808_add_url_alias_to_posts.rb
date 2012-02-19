class AddUrlAliasToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :url_alias, :string
  end
end