require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  it "should create a new instance given valid attributes" do
    Factory.create(:valid_user)
  end

  it "should be invalid with invalid attributes" do
    Factory.build(:invalid_user).should be_invalid
  end
end