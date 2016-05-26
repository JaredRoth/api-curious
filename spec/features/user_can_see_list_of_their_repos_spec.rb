require "rails_helper"

RSpec.feature "User views repos page" do
  scenario 'user sees list of their repos', :vcr do
    visit github_login_path

    click_on("Profile")

    click_on("Repositories")
save_and_open_page
    expect(page).to have_content("api-curious")
    expect(page).to have_content("oauth-workshop")
    expect(page).to have_content("pokemon-cli")
  end
end
