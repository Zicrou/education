class RemoveUserToOuvrier < ActiveRecord::Migration[5.2]
  def change
    remove_column :ouvriers, :user_id
  end
end
