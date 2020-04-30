class AddPostNiveauToExercice < ActiveRecord::Migration[5.2]
  def change
    add_reference :exercices, :niveau, foreign_key: true
  end
end
