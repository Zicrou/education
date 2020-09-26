class AddUserToDepartement < ActiveRecord::Migration[5.2]
  def change
    add_reference :departements, :user, foreign_key: true
  end
end
