require 'rails_helper'

describe "the login process" do

  it "allows a created user to log in" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "Email", :with => "lee@fool.com"
    fill_in "Password", :with => "lee"
    click_on "Log in"
    expect(page).to have_content "Hello"
  end

end
