class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :carriages, :places_amount, :upper_places_amount
  end
end
