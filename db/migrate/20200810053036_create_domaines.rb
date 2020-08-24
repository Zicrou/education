class CreateDomaines < ActiveRecord::Migration[5.2]
  def change
    create_table :domaines do |t|
      t.string :name

      t.timestamps
    end
  end
end
