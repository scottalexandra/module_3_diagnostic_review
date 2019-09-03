require 'rails_helper'

describe Station do
  it "has the necessary properties" do
    station_data = {
      station_name: "station 1",
      street_address: "213 first street",
      fuel_type_code: "ELEC",
      distance: "0.32",
      access_days_time: "24 hours daily"
    }

    station = Station.new(station_data)
    expect(station).to be_a(Station)
    expect(station.name).to eq("station 1")
    expect(station.distance).to eq("0.32")
  end
end
