class AddNumerocniToOuvrier < ActiveRecord::Migration[5.2]
  def change
    add_column :ouvriers, :numerocni, :string
  end
end
