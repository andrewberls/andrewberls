class AddUserPermissions < ActiveRecord::Migration
  def up
    add_column :users, :permissions, :integer
  end

  def down
    remove_column :users, :permissions
  end
end
