Feature: authentication

	As a cottage owner
	I want to have an account
	So that I can use the features of the application

  Scenario: authentication options when not logged in
    Given I am on the home page
    And I am not logged in
    Then I should see "Signup | Login"
  
	Scenario: clicking the signup link
		Given I am on the home page
		When I follow "Signup"
		Then I should be on the signup page
		
	Scenario: registering a new user with valid details
	  Given I am on the signup page
	  When I fill in "login" with "alan"
	  And I fill in "email" with "alan@example.com"
	  And I fill in "password" with "pass"
	  And I fill in "password confirmation" with "pass"
	  And I press "Submit"
	  Then I should be on the home page
	  And I should see "Hi Alan, your signup was successful."

	Scenario: clicking the login link
	  Given I am on the home page
	  When I follow "login"
	  Then I should be on the login page
	  
	Scenario: logging in with valid credentials
	  Given I have a registered user
	  And I am on the login page
	  When I fill in "Login" with "alan"
	  And I fill in "Password" with "pass"
	  And I press "Login"
    Then I should be on the home page
	  And I should see "Login successful"
	
  Scenario: logging in with invalid credentials
    Given I have a registered user
    And I am on the login page
    When I fill in "Login" with "bob"
    And I fill in "Password" with "fred"
    And I press "Login"
    Then I should be on the login page
    And I should see "Invalid username or password"
	  
  Scenario: authentication options when logged in
    Given I have a registered user
    And I am logged in
    Then I should see "My Account | Logout"
    
  Scenario: clicking the My Account link
    Given I have a registered user
    And I am logged in
	  When I follow "My Account"
	  Then I should be on the account edit page
  
  Scenario: clicking the Logout link
    Given I have a registered user
    And I am logged in
    When I follow "Logout"
    Then I should be on the home page
    And I should see "Logout successful"