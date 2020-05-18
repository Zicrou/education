class AddTelephoneToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :telephone, :bigint
  end
end
