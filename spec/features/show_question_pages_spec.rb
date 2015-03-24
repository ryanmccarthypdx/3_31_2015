require "rails_helper"
describe "show a question process" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }

  before do
    sign_in(user)
  end

  it "will show a the title and body of a question" do
    visit questions_path
    click_on question.title
    expect(page).to have_content("So many yaks")
  end
end
