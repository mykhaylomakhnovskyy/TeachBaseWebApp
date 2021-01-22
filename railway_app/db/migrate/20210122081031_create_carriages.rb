class CreateCarriages < ActiveRecord::Migration[6.1]
  def change
    create_table :carriages do |t|
      t.string :carriage_type

      t.integer :places_amount

      t.timestamps
    end
  end
end
