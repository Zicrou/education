class AddSeriRefToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :seri, foreign_key: true
  end
end
