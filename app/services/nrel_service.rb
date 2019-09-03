class NrelService
  def nearest_stations_by_zip(zip)
    response = fetch_data(zip)
    parse_json(response)
  end

  def fetch_data(zip)
    Faraday.get('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?') do |req|
      req.params[:location] = zip
      req.params[:radius] = 6
      req.params[:fuel_type] = "ELEC, LPG"
      req.params[:limit] = 10
      req.headers["x-api-key"] = ENV['nrel_api_key']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
