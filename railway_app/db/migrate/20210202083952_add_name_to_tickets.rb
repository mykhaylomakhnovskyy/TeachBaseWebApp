class AddNameToTickets < ActiveRecord::Migration[6.1]
  def change
    add_columns :tickets,
                :name, :surname, :passport_id,
                type: :string
  end
end
