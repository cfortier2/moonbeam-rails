require "spec_helper"

feature "Home" do
  scenario "has the correct title" do
    visit "/"
    expect(page).to have_title("Moonbeam")
  end
end
