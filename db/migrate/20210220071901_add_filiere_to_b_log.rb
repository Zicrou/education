class AddFiliereToBLog < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :filiere, foreign_key: :true
  end
end
