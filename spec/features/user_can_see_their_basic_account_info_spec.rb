require "rails_helper"

RSpec.feature "User logs in with Github credentials" do
  scenario "user sees their info when clicking on profile", :vcr do
    visit github_login_path

    click_on("Profile")

    expect(current_path).to eq(users_path)
    expect(page).to have_css('img[src="https://avatars.githubusercontent.com/u/11217220?v=3"]')
    within("#starred") do
      expect(page).to have_content("")
    end
    within("#followers") do
      expect(page).to have_content("9")
    end
    within("#following") do
      expect(page).to have_content("2")
    end
  end
end
