class RemoveTopicRefFromBlogs < ActiveRecord::Migration[5.2]
  def change
  	remove_column :blogs, :topic_id, :bigint
  end
end
