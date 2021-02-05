class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
  validates :station_position, uniqueness: { scope: :route_id }

  scope :set_station, ->(station_id) { where("railway_station_id=(#{station_id})") }
end
