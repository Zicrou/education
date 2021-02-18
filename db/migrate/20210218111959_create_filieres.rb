class CreateFilieres < ActiveRecord::Migration[5.2]
  def change
    create_table :filieres do |t|
      t.string :name

      t.timestamps
    end
  end
end
