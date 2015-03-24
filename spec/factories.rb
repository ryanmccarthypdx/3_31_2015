FactoryGirl.define do
  factory(:user) do
    email('lee@fool.com')
    password('lee')
  end
  factory(:question) do
    title("How many yaks would it take to screw in a light bulb?")
    body("So many yaks")
    user_id(1)
    id(1)
  end
  factory(:response) do
    content("not enough yaks")
    user_id(1)
    question_id(1)
    best?(false)
    score(0)
  end

end
