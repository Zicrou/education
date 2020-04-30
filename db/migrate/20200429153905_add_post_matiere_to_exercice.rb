class AddPostMatiereToExercice < ActiveRecord::Migration[5.2]
  def change
    add_reference :exercices, :matiere, foreign_key: true
  end
end
