class AddAdresseToOuvrier < ActiveRecord::Migration[5.2]
  def change
    add_column :ouvriers, :adresse, :string
  end
end
