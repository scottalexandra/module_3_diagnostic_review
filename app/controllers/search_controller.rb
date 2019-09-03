class SearchController < ApplicationController
  def index
    render locals: {
      stations: stations(params[:q])
    }

  end

  def stations(zip)
    # response = fetch_data(zip)
    # parsed_response = parse_json(response)
    parsed_response = nrel_service.nearest_stations_by_zip(zip)

    stations_data = parsed_response[:fuel_stations]
    create_stations(stations_data)
  end

  # def fetch_data(zip)
  #   Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?') do |req|
  #     req.params[:location] = zip
  #     req.params[:radius] = 6
  #     req.params[:fuel_type] = "ELEC, LPG"
  #     req.params[:limit] = 10
  #     req.headers["x-api-key"] = ENV['nrel_api_key']
  #   end
  # end

  # def parse_json(response)
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def create_stations(stations_data)
    stations_data.map do |station|
      Station.new(station)
    end
  end

  def nrel_service
    NrelService.new
  end
end
