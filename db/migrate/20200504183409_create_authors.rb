class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.references :user, foreign_key: true, unique: true
      t.references :etablissement, foreign_key: true
      t.references :matiere, foreign_key: true

      t.timestamps
    end
  end
end
