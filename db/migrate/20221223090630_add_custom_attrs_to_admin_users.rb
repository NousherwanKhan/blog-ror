class AddCustomAttrsToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :first_name, :string
    add_column :admin_users, :last_name, :string
    add_column :admin_users, :username, :string
  end
end
