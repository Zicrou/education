class RemoveTableByDroping < ActiveRecord::Migration[5.2]
  def change
    #drop_table :mainsdoeuvres
    remove_index :metiers, :user_id
    remove_column :metiers, :user_id, :bigint

    remove_index :ouvriers, :metier_id
    remove_column :ouvriers, :metier_id, :bigint

    drop_table :metiers
    drop_table :ouvriers
    drop_table :privileges
    drop_table :responszones
  end
end
