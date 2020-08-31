class CreateCentres < ActiveRecord::Migration[5.2]
  def change
    create_table :centres do |t|
      t.string :numcentre

      t.timestamps
    end
  end
end
