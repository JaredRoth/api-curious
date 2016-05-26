require "rails_helper"

RSpec.feature "User views profile page" do
  scenario 'user sees summary of their own commits', :vcr do
    visit github_login_path

    click_on("Profile")

    expect(current_path).to eq(users_path)
    within(".commits") do
      expect(page).to have_content("Contribution Activity")
      # expect(page).to have_content("14 commits")
      expect(page).to have_content("Pushed 7 to JaredRoth/api-curious")
      expect(page).to have_content("Pushed 2 to JaredRoth/oauth-workshop")
      expect(page).to have_content("Pushed 2 to JaredRoth/pokemon-cli")
      expect(page).to have_content("Pushed 9 to kristindiannefoss/pivot")
    end
  end
  scenario 'user sees summary of commits of those they follow', :vcr do
    visit github_login_path

    visit following_path

    expect(page).to have_content("notmarkmiranda")
    expect(page).to have_content("jwashke")
    expect(page).to have_css(".notmarkmiranda")
    expect(page).to have_css(".jwashke")

    first(:link, "notmarkmiranda").click

    expect(page).to have_content("Pushed 10 to notmarkmiranda/apicurious")
    expect(page).to have_content("Pushed 2 to notmarkmiranda/chaimz-curator")
    expect(page).to have_content("Pushed 3 to notmarkmiranda/ninja")
    expect(page).to have_content("Pushed 2 to notmarkmiranda/pokemon-cli")
    expect(page).to have_content("Pushed 3 to notmarkmiranda/pivot")

    visit following_path
    first(:link, "jwashke").click

    expect(page).to have_content("Pushed 18 to jwashke/which")
  end
end
