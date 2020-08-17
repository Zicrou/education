class AddDomaineRefToOuvriers < ActiveRecord::Migration[5.2]
  def change
    add_reference :ouvriers, :domaine, foreign_key: true
  end
end
