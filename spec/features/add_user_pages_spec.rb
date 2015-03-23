require 'rails_helper'

describe "the add new user process" do
  it "goes from root to the create user page" do
    visit root_path
    click_on "Create an Account"
    expect(page).to have_content "Email"
  end



end
