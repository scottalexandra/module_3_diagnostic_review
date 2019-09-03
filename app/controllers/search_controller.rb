class SearchController < ApplicationController
  def index
    render locals: {
      stations: stations(params[:q])
    }

  end

  def stations(zip)
    # use faraday to make api call to nrel api limit 10, radius 6 miles, only electric and propane
    # https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203&radius=6&limit=10&fuel_type=ELEC, LPG
    response = Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?') do |req|
      req.params[:location] = zip
      req.params[:radius] = 6
      req.params[:fuel_type] = "ELEC, LPG"
      req.params[:limit] = 10
      req.headers["x-api-key"] = ENV['nrel_api_key']
    end
    # parse json response
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    # grab stations from response
    stations_data = parsed_response[:fuel_stations]
    # map through stations to create station objects
    stations_data.map do |station|
      Station.new(station)
    end
  end
end
