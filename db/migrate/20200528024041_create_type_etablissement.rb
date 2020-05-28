class CreateTypeEtablissement < ActiveRecord::Migration[5.2]
  def change
    create_table :type_etablissements do |t|
      t.string :type_etablissment

      t.timestamps
    end
  end
end
