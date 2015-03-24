require("rails_helper")
describe("making a response process") do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end
  it("will add a response to a question") do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    fill_in "Content", :with => "I like yaks"
    click_on "Answer Question"
    expect(page).to have_content("Thanks for answering!")
  end
end
