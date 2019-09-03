class SearchFacade
  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def self.stations(zip)
    new(zip).stations
  end

  def stations
    parsed_response = nrel_service.nearest_stations_by_zip(zip)
    stations_data = parsed_response[:fuel_stations]
    create_stations(stations_data)
  end

  private

  def create_stations(stations_data)
    stations_data.map do |station|
      Station.new(station)
    end
  end

  def nrel_service
    NrelService.new
  end
end
