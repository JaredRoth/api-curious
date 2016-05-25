require "rails_helper"

RSpec.feature "User logs in with Github credentials" do
  scenario "user sees their info when clicking on profile" do
    visit github_login_path

    click_on("Profile")

    expect(current_path).to eq(user_path)
    expect(page).to have_css('img[src="https://avatars.githubusercontent.com/u/11217220?v=3"]')
    within("#starred") do
      expect(page).to have_content("")
    end
  end
end
