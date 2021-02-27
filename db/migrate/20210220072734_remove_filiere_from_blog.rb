class RemoveFiliereFromBlog < ActiveRecord::Migration[5.2]
  def change
    remove_reference :blogs, :filiere, foreign_key: :true
  end
end
