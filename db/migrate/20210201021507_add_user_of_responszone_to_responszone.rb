class AddUserOfResponszoneToResponszone < ActiveRecord::Migration[5.2]
  def change
    add_column :responszones, :user_responszone, :bigint
    add_foreign_key :responszones, :users, name: :user_responszone
  end
end
