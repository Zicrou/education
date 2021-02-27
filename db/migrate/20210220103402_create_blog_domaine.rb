class CreateBlogDomaine < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_domaines do |t|
      
      t.timestamps
    end
  end
end
