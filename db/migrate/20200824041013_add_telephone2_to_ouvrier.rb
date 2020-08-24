class AddTelephone2ToOuvrier < ActiveRecord::Migration[5.2]
  def change
    add_column :ouvriers, :telephone2, :string
  end
end
