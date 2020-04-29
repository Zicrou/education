class AddPostTitleToExercice < ActiveRecord::Migration[5.2]
  def change
    add_column :exercices, :title, :string
  end
end
