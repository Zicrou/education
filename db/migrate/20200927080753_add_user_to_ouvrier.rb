class AddUserToOuvrier < ActiveRecord::Migration[5.2]
  def change
    add_reference :ouvriers, :user, foreign_key: true
  end
end
