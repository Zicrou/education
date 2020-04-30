class CreateTypeExercices < ActiveRecord::Migration[5.2]
  def change
    create_table :type_exercices do |t|
      t.string :name

      t.timestamps
    end
  end
end
