@ECS-1351 @VSTS-63974
Feature: ECS-1351 -- Partner Choose No Numbers
  In order for Vodafone to recieve a new SIP order online
  As a partner
  I need to be able to provide all required information using user friendly forms with Trunk Only Order

  Rules:
    1.  Partner able to successfully place Order With no numbers required (TRUNK ONLY ORDER)


  Background:
    Given I log in as a partner

  Scenario: The partner can create SIP Order without Numbers and No Port IN. SIP Trunk Only Order.
    Given I navigate from the dashboard to the "new order service details" page
    Then I should not see the "Save and continue" button
    When I select the "12 months" option in the "commitment period" dropdown list
    Then I should still not see the "Save and continue" button
    Then I should not see the "Save and continue" button
    When I fill in the "number of channels" input with the text "50"
    Then I should still not see the "Save and continue" button
    When I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    And I take a screenshot named "service_details_1.png"
    And I click the "Save and continue" button
    And I should see the text "Service features"
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_details_1.png"
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    When I click the "Confirm Order" button
    And I wait for 1 second
    And I wait for "Thank You" text
    And I wait for 1 second
    Then I should be on the "new order confirmation" page
    And I should see the text "Your order number is"
    And I take a screenshot named "new_order_confirmation_page.png"
