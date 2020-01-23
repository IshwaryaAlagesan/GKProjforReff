@ECS-431 @VSTS-47651
Feature: ECS-431 -- Partner Trunk Direction

  Rules:
    1.  Partner can be able to create SIP Order with New Number (Both Ways)
    2.  Partner can be able to create SIP Order with Outbound Calls Only (Outbound Only)
    3.  Partner cannot able to select both New Numbers and Outbound Calls options


  Background:
    Given I log in as a partner

  Scenario: Partner can be able to create SIP Order with New Number (Both Ways)
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the text "Service details"
    When I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "new numbers" checkbox
    Then I should see the "amount of new numbers" input
    When I fill in the "amount of new numbers" input with the text "10"
    And I click the "Reserve" button
    And I wait for 10 seconds
    And I wait for the element "//div[@class='vfuk-Notification__content']"
    And I should see the text "We have successfully reserved 10 new numbers for you."
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
    Then I should be on the "new order confirmation" page
    And I should see the text "Your order number is"
    And I take a screenshot named "new_order_confirmation_page.png"


  Scenario: Partner can be able to create SIP Order with Outbound Calls Only (Outbound Only)
    Given I navigate from the dashboard to the "new order service details" page
    And I wait for 1 seconds
    Then I should see the text "Service details"
    When I select the "12 months" option in the "commitment period" dropdown list
    When I fill in the "number of channels" input with the text "50"
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
    Then I should be on the "new order confirmation" page
    And I should see the text "Your order number is"
    And I take a screenshot named "new_order_confirmation_page.png"


  Scenario: Partner cannot able to select both New Numbers and Outbound Calls options
    Given I navigate from the dashboard to the "new order service details" page
    When I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "new numbers" checkbox
    Then I should see the "amount of new numbers" input
    When I fill in the "amount of new numbers" input with the text "30"
    Then the "No, I only need outbound calls" checkbox should not be checked
    And I take a screenshot named "select_service_page_1.png"
    When I click the "I only need Outbound calls" radio button
    Then the "Yes, I would like to request:" checkbox should not be checked
    And I take a screenshot named "select_service_page_2.png"
