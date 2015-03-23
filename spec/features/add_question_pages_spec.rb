require 'rails_helper'
describe "the creating question process" do
  it "allows a user to create a question" do
    FactoryGirl.create(:user)
    visit root_path
    fill_in "Email", :with => "lee@fool.com"
    fill_in "Password", :with => "lee"
    click_on "Log in"
    fill_in "Title", :with => "Ryan's"
    fill_in "Body", :with => "Face"
    click_on "Ask question"
    expect(page).to have_content "Ryan's"
  end
end
