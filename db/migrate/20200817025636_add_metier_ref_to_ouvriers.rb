class AddMetierRefToOuvriers < ActiveRecord::Migration[5.2]
  def change
    add_reference :ouvriers, :metier, foreign_key: true
  end
end
