class CreateOuvriers < ActiveRecord::Migration[5.2]
  def change
    create_table :ouvriers do |t|
      t.string :name
      t.string :prenom
      t.string :telephone

      t.timestamps
    end
  end
end
