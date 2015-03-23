require 'rails_helper'

describe "the add new user process" do
  it "goes from root to the create user page" do
    visit root_path
    click_on "Create an Account"
    expect(page).to have_content "Email"
  end

  it "creates a new account when the form works as planned" do
    visit root_path
    click_on "Create an Account"
    fill_in "Email", :with => "lee@fool.com"
    fill_in "Password", :with => "lee"
    fill_in "Confirm password", :with => "lee"
    click_on "Create Account"
    expect(page).to have_content "Success!"
  end



end
