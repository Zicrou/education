class CreateSeris < ActiveRecord::Migration[5.2]
  def change
    create_table :seris do |t|
      t.string :name
      t.references :niveau, foreign_key: true

      t.timestamps
    end
  end
end
