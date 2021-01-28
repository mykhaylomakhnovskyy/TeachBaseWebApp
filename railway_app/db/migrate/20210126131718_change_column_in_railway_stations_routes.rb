class ChangeColumnInRailwayStationsRoutes < ActiveRecord::Migration[6.1]
  def change
    rename_column :railway_stations_routes,
                  :station_serial_number,
                  :station_position
  end
end
