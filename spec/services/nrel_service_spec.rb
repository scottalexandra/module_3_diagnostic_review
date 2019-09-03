require 'rails_helper'

describe NrelService do
  it "can fetch nearest station by zipcode" do
    nrel_service = NrelService.new

    json_data = nrel_service.nearest_stations_by_zip("80203")
    expect(json_data).to be_a(Hash)
    expect(json_data).to have_key(:fuel_stations)
    expect(json_data[:fuel_stations]).to be_an(Array)
  end
end
