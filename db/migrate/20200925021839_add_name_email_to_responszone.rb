class AddNameEmailToResponszone < ActiveRecord::Migration[5.2]
  def change
    add_column :responszones, :name, :string
    add_column :responszones, :email, :string
  end
end
