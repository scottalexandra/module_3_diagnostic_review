require 'rails_helper'

feature "user can search for nearest station" do
  scenario "by zipcode" do
    # When I visit "/"
    visit "/"
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    fill_in :q, with: "80203"
    # And I click "Locate"
    click_button "Locate"
    # Then I should be on page "/search"
    expect(current_path).to eq(search_path)
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_selector(".station", count:10)
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    within(first(".station")) do
      expect(page).to have_selector(".name")
      expect(page).to have_selector(".address")
      expect(page).to have_selector(".fuel_types")
      expect(page).to have_selector(".distance")
      expect(page).to have_selector(".access_times")
    end
  end
end
