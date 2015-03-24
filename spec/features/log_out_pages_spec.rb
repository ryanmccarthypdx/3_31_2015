require 'rails_helper'

describe "the logout process" do

  it "renders the logout link" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "Email", :with => "lee@fool.com"
    fill_in "Password", :with => "lee"
    click_on "Log in"
    expect(page).to have_content "Log out"
  end

  it "works when the logout link is clicked" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "Email", :with => "lee@fool.com"
    fill_in "Password", :with => "lee"
    click_on "Log in"
    click_on "Log out"
    expect(page).to have_content "successful"
  end

end
