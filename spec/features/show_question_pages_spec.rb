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

  it "will show the edit/delete links if the user is the creator of that question" do
    question = FactoryGirl.create(:question, :user_id => user.id)
    visit question_path(question)
    expect(page).to have_content("Edit")
  end

  it "will not show the edit/delete links if the user isn't the creator of that question" do
    question = FactoryGirl.create(:question)
    visit questions_path
    click_on question.title
    expect(page).to have_no_content("Edit")
  end


end
