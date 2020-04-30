class CreateMatieres < ActiveRecord::Migration[5.2]
  def change
    create_table :matieres do |t|
      t.string :name
      t.references :niveau, foreign_key: true
      t.references :serie, foreign_key: true

      t.timestamps
    end
  end
end
