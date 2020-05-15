class RemoveAuthorFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :author_id, :bigint
  end
end
