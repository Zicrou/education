class AddNiveauRefToMatieres < ActiveRecord::Migration[5.2]
  def change
    add_reference :matieres, :niveau, foreign_key: true
  end
end
