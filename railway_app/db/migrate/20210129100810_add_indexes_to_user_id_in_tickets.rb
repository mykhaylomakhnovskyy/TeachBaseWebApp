class AddIndexesToUserIdInTickets < ActiveRecord::Migration[6.1]
  def change
    remove_belongs_to :tickets, :user
    add_belongs_to :tickets, :user, index: true
  end
end
