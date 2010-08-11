def login
  visit path_to("the login page")
  fill_in "Login", :with => "alan"
  fill_in "Password", :with => "pass"
  click_button "Login"
end