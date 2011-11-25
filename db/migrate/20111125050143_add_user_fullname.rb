class AddUserFullname < ActiveRecord::Migration
  def up
    add_column :users, :full_name, :string
  end

  def down
    remove_column :users, :full_name
  end
end
