class AddSeatTypesToCarriages < ActiveRecord::Migration[6.1]
  def change
    add_column :carriages, :side_down_places_amount, :integer
    add_column :carriages, :side_upper_places_amount, :integer
    add_column :carriages, :seating_places_amount, :integer
    add_column :carriages, :type, :string
    add_column :carriages, :number, :integer
  end
end
