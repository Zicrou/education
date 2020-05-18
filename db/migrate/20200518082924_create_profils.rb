class CreateProfils < ActiveRecord::Migration[5.2]
  def change
    create_table :profils do |t|
      t.string :name

      t.timestamps
    end
  end
end
