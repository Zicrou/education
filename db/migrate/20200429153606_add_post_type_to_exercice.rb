class AddPostTypeToExercice < ActiveRecord::Migration[5.2]
  def change
    add_reference :exercices, :type_exercice, foreign_key: true
  end
end
