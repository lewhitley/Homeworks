require 'spec_helper'

describe User do

  subject(:user) { User.new('testing','password') }
  let(:user2) { User.new('testtest','123456') }
  let(:token) { user.session_token }

  context "validations and associations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(10).on(:create) }

    it { should have_many(:subs) }
    it { should have_many(:comments) }
  end

  context "#is_password?" do
    it "returns true when the correct password is given" do
      expect(user.is_password?('password')).to be true
    end

    it "returns false when an incorrect password is given" do
      expect(user.is_password?('password1')).to be false
    end
  end

  context "#reset_session_token" do
    it "changes the user's session token in the database" do
      user.reset_session_token
      expect(user.session_token).to_not eq(token)
    end
  end

  context "::find_by_credentials" do
    it "finds user given correct username and password" do
      expect(User.find_by_credentials('testing','password')).to eq(user)
      expect(User.find_by_credentials('testtest','123456')).to eq(user2)
    end

    it "returns nil if wrong username or password provided" do
      expect(User.find_by_credentials('testing','password1')).to be nil
      expect(User.find_by_credentials('testing','123456')).to be nil
    end
  end
end
