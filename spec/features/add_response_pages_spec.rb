require("rails_helper")

describe("making a response process") do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it "will add a response to a question", js: true do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    fill_in "Content", :with => "I like yaks"
    click_on "Create Response"
    expect(page).to have_content("I like yaks | Edit | Delete")
  end

  it "will not allow editing of a response if not the original responder", js: true do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    fill_in "Content", :with => "I like yaks"
    click_on "Create Response"
    click_on "Log out"
    user2 = FactoryGirl.create(:user, :email => "ryan@test.com")
    sign_in(user2)
    visit question_path(question)
    expect(page).to have_no_content("Edit")
  end

  it "will allow editing of a response if the original responder", js: true do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    click_on "Log out"
    user2 = FactoryGirl.create(:user, :email => "ryan@test.com")
    sign_in(user2)
    visit question_path(question)
    fill_in "Content", :with => "I like yaks"
    click_on "Create Response"
    visit question_path(question)
    expect(page).to have_content("Edit")
  end
end
