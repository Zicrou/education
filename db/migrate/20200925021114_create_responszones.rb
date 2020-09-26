class CreateResponszones < ActiveRecord::Migration[5.2]
  def change
    create_table :responszones do |t|
      t.string :telephone
      t.string :cni
      t.string :photocni
      t.string :photo
      t.references :user, foreign_key: true
      t.references :country, foreign_key: true
      t.references :region, foreign_key: true
      t.references :departement, foreign_key: true

      t.timestamps
    end
  end
end
