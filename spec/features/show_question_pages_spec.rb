require "rails_helper"
describe "show a question process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "will show a the title and body of a question" do
    question = FactoryGirl.create(:question)
    visit questions_path
    click_on question.title
    expect(page).to have_content("So many yaks")
  end


end
