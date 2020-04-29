class CreateExercices < ActiveRecord::Migration[5.2]
  def change
    create_table :exercices do |t|
      t.text :introduction
      t.text :developpement
      t.text :conclusion

      t.timestamps
    end
  end
end
