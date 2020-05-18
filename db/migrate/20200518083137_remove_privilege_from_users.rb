class RemovePrivilegeFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :privilege_id, :bigint
  end
end
