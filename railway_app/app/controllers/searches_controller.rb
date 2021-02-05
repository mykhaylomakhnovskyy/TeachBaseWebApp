class SearchesController < ApplicationController

  def show
    @routes = Route.all
  end

  def create
    @relations = RailwayStationsRoute.all
    @routes = []
    first_stations = @relations.set_station(params[:railway_station_id1])
    second_stations = @relations.set_station(params[:railway_station_id2])
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

  def buy_ticket
  end

  def show_ticket
    @name = params[:name]
    @surname = params[:surname]
    @passport = params[:passport_id]
  end

  private

end
