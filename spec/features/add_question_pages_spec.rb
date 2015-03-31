require 'rails_helper'
describe "the creating question process" do

  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "allows a user to create a question", js: true do
    # FactoryGirl.create(:user)
    # visit root_path
    # fill_in "Email", :with => "lee@fool.com"
    # fill_in "Password", :with => "lee"
    # click_on "Log in"
    visit questions_path
    fill_in "Title", :with => "Ryan's"
    fill_in "Body", :with => "Face"
    click_on "Create Question"
    expect(page).to have_content "Ryan's"
  end
end
