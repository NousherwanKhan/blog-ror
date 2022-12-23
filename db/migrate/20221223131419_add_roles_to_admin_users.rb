class AddRolesToAdminUsers < ActiveRecord::Migration[6.1]

  def change
    # add_column :admin_users, :role_id, :string
    add_reference :admin_users, :role, index: true, default: 2
  end

end
