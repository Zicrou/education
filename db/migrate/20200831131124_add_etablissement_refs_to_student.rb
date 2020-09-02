class AddEtablissementRefsToStudent < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :etablissement, foreign_key: true
  end
end
