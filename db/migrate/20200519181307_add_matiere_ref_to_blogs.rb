class AddMatiereRefToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :matiere, foreign_key: true
  end
end
