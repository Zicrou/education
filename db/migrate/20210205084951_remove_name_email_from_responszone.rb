class RemoveNameEmailFromResponszone < ActiveRecord::Migration[5.2]
  def change
    remove_column :responszones, :name, :string
    remove_column :responszones, :email, :string
  end
end
