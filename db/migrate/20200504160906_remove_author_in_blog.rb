class RemoveAuthorInBlog < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :blogs, column: :user_id
  end
end
