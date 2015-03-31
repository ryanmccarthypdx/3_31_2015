require "rails_helper"
describe "edit/delete a question process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "will show the edit button if user was the one who created the question" do
    question = FactoryGirl.create(:question, :user_id => user.id)
    visit questions_path
    expect(page).to have_content("Edit")
  end

  # it "will open the edit form" do
  #   question = FactoryGirl.create(:question, :user_id => user.id)
  #   visit questions_path
  #   click_on "Edit"
  #   expect(page).to have_content("Title")
  # end

  it "will edit the text of a question" do
    question = FactoryGirl.create(:question, :user_id => user.id)
    visit question_path(question)
    click_on "Edit"
    fill_in "Body", :with => "Lee kisses yaks on the mouth"
    click_on "Ask question"
    visit question_path(question)
    expect(page).to have_content("Lee kisses yaks on the mouth")
  end

  it "will edit the title of a question" do
    question = FactoryGirl.create(:question, :user_id => user.id)
    visit question_path(question)
    click_on "Edit"
    fill_in "Title", :with => "How many yaks does Lee kiss?"
    click_on "Ask question"
    expect(page).to have_content("How many yaks does Lee kiss?")
  end

  it "will delete a question" do
    question = FactoryGirl.create(:question, :user_id => user.id)
    visit question_path(question)
    click_on "Delete"
    expect(page).to have_no_content("light bulb")
  end
end
