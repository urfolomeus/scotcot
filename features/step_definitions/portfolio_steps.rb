Given /^I am a cottage owner$/ do
  @user = Factory.create(:owner)
end

Given /^I am a holiday maker$/ do
  @user = Factory.create(:valid_user)
end

When /^I log in$/ do
  login
end