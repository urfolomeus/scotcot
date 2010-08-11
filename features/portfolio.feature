Feature: portfolio management

  As a cottage owner
  I want to create and maintain a portfolio of my properties
  So that I can manage the bookings for one or more properties
  
  Scenario: owner should be able to access their portfolio
    Given I am a cottage owner
    When I log in 
    Then I should be on the home page
    And I should see "Rent It!"
    
  Scenario: holiday makers should not be able to access a portfolio
    Given I am a holiday maker
    When I log in 
    Then I should be on the home page
    And I should not see "Rent It!"
    
  Scenario: owner should be able to access their portfolio
    Given I am a cottage owner
    And I am logged in
    When I follow "Rent It!"
    Then I should be on the portfolio page
    And I should see "Alan's Portfolio Dashboard"