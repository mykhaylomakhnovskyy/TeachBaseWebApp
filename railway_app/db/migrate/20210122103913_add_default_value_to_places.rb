class AddDefaultValueToPlaces < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:carriages, :upper_places_amount, from: nil, to: 0)
    change_column_default(:carriages, :down_places_amount, from: nil, to: 0)
  end
end
