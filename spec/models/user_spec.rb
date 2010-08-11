require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  it "should create a new instance given valid attributes" do
    Factory.create(:valid_user)
  end

  it "should be invalid with invalid attributes" do
    Factory.build(:invalid_user).should be_invalid
  end
  
  context "#portfolio" do
    it "should create a new portfolio if it doesn't already exist" do
      user = Factory.create(:valid_user)
      Portfolio.should_receive(:create)
      user.portfolio
    end
    
    it "should return the portfolio if one already exists" do
      user = Factory.create(:valid_user)
      user.portfolio = user.create_portfolio
      Portfolio.should_not_receive(:create)
      user.portfolio
    end
  end
  
  context "#is_owner?" do
    it "should return true if user has role 'rent'" do
      user = Factory.create(:owner)
      user.is_owner?.should be_true
    end
    
    it "should return false if user doesn't have role 'rent'" do
      user = Factory.create(:valid_user)
      user.is_owner?.should be_false
    end
  end
end