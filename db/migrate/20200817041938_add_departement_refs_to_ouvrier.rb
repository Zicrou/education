class AddDepartementRefsToOuvrier < ActiveRecord::Migration[5.2]
  def change
    add_reference :ouvriers, :departement, foreign_key: true
  end
end
