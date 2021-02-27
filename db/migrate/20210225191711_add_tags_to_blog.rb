class AddTagsToBlog < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :tag, foreign_key: true
  end
end
