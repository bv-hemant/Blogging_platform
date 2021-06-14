class AddIndexToAdminUsers < ActiveRecord::Migration[6.1]
  def change
   add_index :admin_users, [:provider, :uid], unique: true
  end
end
