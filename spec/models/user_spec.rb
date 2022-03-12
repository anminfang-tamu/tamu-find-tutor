require 'rails_helper'

RSpec.describe User, type: :model do
    before(:each) do
        @user = create(:user)
        @user1 = User.new
    end
    
    it "should create user" do
        expect(@user.valid?).to be true
    end
  
    it "should not create user" do
        @user = User.new
        expect(@user.valid?).to be false
    end
  
    it "username should be existing" do
        expect(@user.username).to eq "brady555"
    end
    
    it "username should be larger than 3" do
        expect(@user.username.length).to be >= 3
    end
  
    it "password length should larger than 6" do
        expect(@user.password.length).to be >= 6
    end
  
    it "should not be valid if email is not in format" do
        @user.email = "abcd.com"
        expect(@user.valid?).to be false
    end
    
    it "should be invalid if username is duplicate" do
        @user1.username = "brady555"
        expect(@user1.valid?).to be false
    end
end
