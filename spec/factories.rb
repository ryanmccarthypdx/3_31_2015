FactoryGirl.define do
  factory(:user) do
    email('lee@fool.com')
    password('lee')
  end
  factory(:question) do
    title("How many yaks would it take to screw in a light bulb?")
    body("So many yaks")
    user_id(1)
  end
end
