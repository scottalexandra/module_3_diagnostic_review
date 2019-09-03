class SearchController < ApplicationController
  def index
    render locals: {
      stations: SearchFacade.new(params[:q]).stations
    }

  end

  # def stations(zip)
  #   parsed_response = nrel_service.nearest_stations_by_zip(zip)
  #   stations_data = parsed_response[:fuel_stations]
  #   create_stations(stations_data)
  # end
  #
  # def create_stations(stations_data)
  #   stations_data.map do |station|
  #     Station.new(station)
  #   end
  # end
  #
  # def nrel_service
  #   NrelService.new
  # end
end
