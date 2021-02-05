class AddTwoColumnsToRailwayStationsRoutes < ActiveRecord::Migration[6.1]
  def change
    add_columns :railway_stations_routes,
                :arrival_time, :departure_time,
                type: :DateTime, default: 0
  end
end
