class AddColumnName < ActiveRecord::Migration[6.1]
  def change
    add_column :carriages, :down_places_amount, :integer, default: 0
  end
end
