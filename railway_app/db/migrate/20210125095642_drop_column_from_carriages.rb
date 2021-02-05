class DropColumnFromCarriages < ActiveRecord::Migration[6.1]
  def change
    remove_column :carriages, :carriage_type
  end
end
