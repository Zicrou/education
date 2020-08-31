class AddNiveauSeriJuryRefsToStudent < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :niveau, foreign_key: true
    add_reference :students, :seri, foreign_key: true
    add_reference :students, :juri, foreign_key: true
  end
end
