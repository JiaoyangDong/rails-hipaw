class RemoveAdminAndAddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :admin, :boolean if column_exists?(:users, :admin)
    add_column :users, :role, :string unless column_exists?(:users, :role)
  end
end
