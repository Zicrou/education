class RemoveUserRefsToOuvrier < ActiveRecord::Migration[5.2]
    def change
      remove_foreign_key :ouvriers, column: :user_id
    end
  end
  

  class RemoveUserToOuvrier < ActiveRecord::Migration[5.2]
    def change
      remove_column :ouvriers, :user_id
    end
  end
  