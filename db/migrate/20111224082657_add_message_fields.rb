class AddMessageFields < ActiveRecord::Migration
  def up
    add_column :messages, :name, :text
    add_column :messages, :email, :text
    add_column :messages, :message, :text
          
  end

  def down
    remove_column :messages, :name
    remove_column :messages, :email
    remove_column :messages, :message
  end
end
