require 'rails_helper'

describe User do
  it { should have_many :questions }
  it { should validate_confirmation_of :password }

  describe '#encrypt_password' do
    it('Creates a salt for passwords when creating a new user') do
      test_user = User.create({:email => "Andy@andy.com", :password => "1234"})
      expect(test_user.password_salt).to be_truthy
    end

    it('Creates a hash for passwords when creating a new user') do
      test_user = User.create({:email => "Andy@andy.com", :password => "1234"})
      expect(test_user.password_hash).to be_truthy
    end
  end

end
