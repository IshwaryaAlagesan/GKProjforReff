@ECS-1571 @VSTS-64023
Feature: ECS-1571 -- Privacy and Cookies Notice


  Rules:
  1.  Partner can be able to see the Privacy & Cookie Policy link in the page footer
  2.  Partner can be able to navigate to Privacy and Cookie Policy Page
  3.  Partner can be able to Privacy and Cookie Policy link appears in the Create new order page
  4.  Partner can be able to see Privacy and Cookie Policy content in the Privacy Page
  5.  Partner can be able to navigate back to Dashboard page from Privacy Page

  Background:
    Given I log in as a partner

  Scenario: Partner can be able to see the Privacy & Cookie Policy link in the page footer
    Given I should see the text of "Privacy & Cookie Policy" in the "//footer[@class='vfuk-PageFooter__footer']" segment
    Then I take a screenshot named "privacy_page_1.png"

  Scenario: Partner can be able to navigate to Privacy and Cookie Policy Page
    Given I navigate from the dashboard to the "privacy and cookie page" page
    Then I should be on the "privacy and cookie page" page
    And I should see the text "Privacy & Cookie Policy"
    And I take a screenshot named "privacy_page_2.png"

  Scenario: Partner can be able to Privacy and Cookie Policy link appears in the Create new order page
    Given I navigate from the dashboard to the "new order business details" page
    Then I should be on the "new order business details" page
    And I should see the text of "Privacy & Cookie Policy" in the "//footer[@class='vfuk-PageFooter__footer']" segment
    And I take a screenshot named "privacy_page_3.png"

  Scenario: Partner can be able to see Privacy and Cookie Policy content in the Privacy Page
    Given I navigate from the dashboard to the "privacy and cookie page" page
    Then I should be on the "privacy and cookie page" page
    And I should see the text "Privacy & Cookie Policy"
    And I should see the text "This privacy supplement gives some general information around the Business Portal"
    And I should see the text "please use our privacy query form and a member of our dedicated team will respond to you"
    And I should see the text "the telephone numbers that you wish to port in order to carry out that transfer;"
    And I should see the text "when you place an order, the initials from your name"
    And I should see the text "your credential information such as password"
    And I take a screenshot named "privacy_page_4.png"

  Scenario: Partner can be able to navigate back to Dashboard page from Privacy Page
    Given I navigate from the dashboard to the "privacy and cookie page" page
    Then I should be on the "privacy and cookie page" page
    When I click the element "//span[@class='SVGInline']"
    And I wait for 3 seconds
    Then I should see the text "Welcome"
    And I should see the text "Vodafone Business Portal"
    And I take a screenshot named "privacy_page_5.png"