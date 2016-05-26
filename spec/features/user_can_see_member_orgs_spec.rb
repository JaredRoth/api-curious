require "rails_helper"

RSpec.feature "User views profile page" do
  scenario 'user sees nothing if not a member', :vcr do
    visit github_login_path

    click_on("Profile")

    within("#orgs") do
      expect(page).to have_content("Not a single Organization")
    end
  end
  scenario 'user sees list of member organizations' do
    # somehow log in as someone else
    # or
    # make a request to @connection.get "users/mikedao/orgs"
  end
end
