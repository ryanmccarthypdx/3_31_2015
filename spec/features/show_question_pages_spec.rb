require "rails_helper"
describe "show a question process" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }

  before do
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
  end

  it "will show a the title and body of a question" do
    visit questions_path
    click_on question.title
    expect(page).to have_content("So many yaks")
  end
end
