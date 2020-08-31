class AddCentreRefsToJuri < ActiveRecord::Migration[5.2]
  def change
    add_reference :juris, :centre, foreign_key: true
  end
end
