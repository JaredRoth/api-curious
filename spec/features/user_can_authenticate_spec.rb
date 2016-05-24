require "rails_helper"

RSpec.feature "User logs in with Github credentials" do
  scenario "existing user is logged in" do
    user = create(:user, uid: "1234", username: "user")
    expect(User.all.count).to eq(1)
    expect(User.first.uid).to eq("1234")

    visit root_path
    click_on("Login")

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Welcome, user")
    expect(User.all.count).to eq(1)
  end

  scenario "new user is created" do
    expect(User.all.count).to eq(0)
    visit github_login_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, user")
    expect(User.all.count).to eq(1)
  end
end
