class AddPhotoAndPhotocniToOuvrier < ActiveRecord::Migration[5.2]
  def change
    add_column :ouvriers, :photo, :string
    add_column :ouvriers, :photocni, :string
  end
end
