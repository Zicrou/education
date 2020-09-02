class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :nom
      t.string :prenom
      t.string :cni
      t.string :telephone
      t.string :numtable
      t.string :email

      t.timestamps
    end
  end
end
