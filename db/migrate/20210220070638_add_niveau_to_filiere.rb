class AddNiveauToFiliere < ActiveRecord::Migration[5.2]
  def change
    add_reference :filieres, :niveau, foreign_key: :true 
  end
end
