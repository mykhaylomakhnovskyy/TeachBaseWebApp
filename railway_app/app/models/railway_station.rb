class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :asc, -> { order('railway_stations_routes.station_position') }

  def update_position(route, position)
    station_route = station_route(route)
    station_route&.update(station_position: position)
  end

  def position_in(route)
    station_route(route).try(:station_position)
  end

  def arrival_time(route)
    station_route(route).try(:arrival_time)
  end

  def departure_time(route)
    station_route(route).try(:departure_time)
  end

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
