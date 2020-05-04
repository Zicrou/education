class CreateEtablissements < ActiveRecord::Migration[5.2]
  def change
    create_table :etablissements do |t|
      t.string :name
      t.string :adresse
      t.references :departement, foreign_key: true

      t.timestamps
    end
  end
end
