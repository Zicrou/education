class RemoveUserRefsToOuvrier < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :ouvriers, column: :user_id
  end
end
