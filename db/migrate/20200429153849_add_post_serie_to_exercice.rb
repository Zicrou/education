class AddPostSerieToExercice < ActiveRecord::Migration[5.2]
  def change
    add_reference :exercices, :serie, foreign_key: true
  end
end
