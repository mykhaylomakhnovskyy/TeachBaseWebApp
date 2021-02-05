class AddFlagColumnToTrains < ActiveRecord::Migration[6.1]
  def change
    add_column :trains, :flag, :boolean, default: true
  end
end
