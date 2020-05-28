class DropTypeEtablisement < ActiveRecord::Migration[5.2]
  def change
  	drop_table :type_etablissements
  end
end
