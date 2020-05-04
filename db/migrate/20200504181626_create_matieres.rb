class CreateMatieres < ActiveRecord::Migration[5.2]
  def change
    create_table :matieres do |t|
      t.string :name
      t.references :seri, foreign_key: true

      t.timestamps
    end
  end
end
