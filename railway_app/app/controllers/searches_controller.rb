class SearchesController < ApplicationController
  def index
  end

  def show
    @routes = Route.all
  end

  def create
    @relations = RailwayStationsRoute.all
    @routes = []
    first_stations = @relations.where("railway_station_id=#{params[:railway_station_id1]}")
    second_stations = @relations.where("railway_station_id=#{params[:railway_station_id2]}")
    first_stations.each do |first_station|
      second_stations.each do |second_station|
        if first_station.route_id == second_station.route_id &&
           first_station.station_position < second_station.station_position
          @routes << Route.all.where("id=#{first_station.route_id}")
        end
      end
    end
    @routes
  end

  def show_ticket

  end

  private

end
