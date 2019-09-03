require 'rails_helper'

feature "user can search for nearest station" do
  scenario "by zipcode" do
    visit "/"
    fill_in :q, with: "80203"
    click_button "Locate"

    expect(current_path).to eq(search_path)
    expect(page).to have_selector(".station", count:10)
    within(first(".station")) do
      expect(page).to have_selector(".name")
      expect(page).to have_selector(".address")
      expect(page).to have_selector(".fuel_types")
      expect(page).to have_selector(".distance")
      expect(page).to have_selector(".access_times")
    end
  end
end
