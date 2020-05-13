class RemovePrivilegeKeyInUser < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :users, column: :privilege_id
  end
end
