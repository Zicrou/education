class AddDepartementRefsToCentre < ActiveRecord::Migration[5.2]
  def change
    add_reference :centres, :departement, foreign_key: true
  end
end
