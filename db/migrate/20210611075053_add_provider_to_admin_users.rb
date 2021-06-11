class AddProviderToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :provider, :string
    add_index :admin_users, [:provider, :uid], unique: true
  end
end
