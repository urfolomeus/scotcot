Given /^I am not logged in$/ do
  # do nothing as user will not be logged in by default
end

Given /^I have a registered user$/ do
  @user = Factory.create(:valid_user)
end

Given /^I am logged in$/ do
  visit path_to("the login page")
  fill_in "Login", :with => "alan"
  fill_in "Password", :with => "pass"
  click_button "Login"
end