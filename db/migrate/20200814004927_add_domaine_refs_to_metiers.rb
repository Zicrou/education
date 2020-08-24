class AddDomaineRefsToMetiers < ActiveRecord::Migration[5.2]
  def change
    add_reference :metiers, :domaine, foreign_key: true
  end
end
