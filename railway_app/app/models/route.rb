class Route < ApplicationRecord
  validates :name, presence: true

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  scope :route_with_station, ->(station_id) { joins('railway_stations_routes').where("railway_stations_routes.railway_station_id=(#{station_id})") }

end
