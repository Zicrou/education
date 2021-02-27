class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.references :tag
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
