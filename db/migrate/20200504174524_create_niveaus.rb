class CreateNiveaus < ActiveRecord::Migration[5.2]
  def change
    create_table :niveaus do |t|
      t.string :name
      t.string :abbrege

      t.timestamps
    end
  end
end
