class CreateJuris < ActiveRecord::Migration[5.2]
  def change
    create_table :juris do |t|
      t.string :numjuri

      t.timestamps
    end
  end
end
