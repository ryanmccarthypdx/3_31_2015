require 'rails_helper'

def sign_in(user)
  visit '/log_in'
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Sign in"
end
