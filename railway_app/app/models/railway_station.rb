class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :asc, ->(route_id) { joins(:railway_stations_routes).where("railway_stations_routes.route_id == #{route_id}").order(:serial_number) }
end
