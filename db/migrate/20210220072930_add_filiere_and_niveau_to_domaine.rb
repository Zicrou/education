class AddFiliereAndNiveauToDomaine < ActiveRecord::Migration[5.2]
  def change
    add_reference :domaines, :niveau, foreign_key: :true
    add_reference :domaines, :filiere, foreign_key: :true
  end
end
