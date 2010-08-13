require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  context "creating a new user" do
    it "should create a new instance given valid attributes" do
      Factory.create(:valid_user)
    end

    it "should be invalid with invalid attributes" do
      Factory.build(:invalid_user).should be_invalid
    end
    
    it "should create a portfolio for a new user if user is an owner" do
      Portfolio.should_receive(:create)
      user = Factory.create(:owner)
    end
    
    it "should not create a portfolio for a new user if user is not an owner" do
      Portfolio.should_not_receive(:create)
      user = Factory.create(:valid_user)
    end
  end
  
  context "updating user information" do
    it "should create a portfolio if user is becoming an owner and no portfolio exists" do
      user = Factory.create(:valid_user)
      user.roles = ["rent_out"]
      Portfolio.should_receive(:create)
      user.save
    end
    
    it "should not create a portfolio if user is becoming an owner but portfolio exists" do
      user = Factory.create(:valid_user)
      user.portfolio = Factory.create(:portfolio)
      user.roles = ["rent_out"]
      Portfolio.should_not_receive(:create)
      user.save
    end
  end
  
  context "#is_owner?" do
    it "should return true if user has role 'rent_out'" do
      user = Factory.create(:owner)
      user.is_owner?.should be_true
    end
    
    it "should return false if user doesn't have role 'rent_out'" do
      user = Factory.create(:valid_user)
      user.is_owner?.should be_false
    end
  end
end