@ECS-2880 @VSTS-56671
Feature: ECS-2880 -- Select Commitment Period
  In order for Vodafone to receive a new SIP order online
  As a partner can able to select Commitment Period

  Rules:
    1.  The partner can able to create a successful SIP order with 12 Month Commitment Period
    2.  The partner can able to create a successful SIP order with 36 Month Commitment Period
    3.  The partner can able to select 12 Month Commitment Period and validate the same in Order Summary Page
    4.  The partner can able to select 36 Month Commitment Period and validate the same in Order Summary Page
    5.  The partner see Save and Continue Button after Commitment Period Selected
    6.  The partner could not see Save and Continue Button without Commitment Period Selected


  Background:
    Given I log in as a partner


#  @CreateSIPOrderwithMinimumChannels
  Scenario: The partner can be able to create a SIP order with 12 Months Commitment Period
    Given I navigate from the dashboard to the "new order service details" page
    When I select the "12 months" option in the "commitment period" dropdown list
    Then I should see the text "Order SIP"
    When I fill in the "number of channels" input with the text "8"
    And I click the "I only need Outbound calls" radio button
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
    And I wait for page to load
    Then I should be on the "new order confirmation" page
    And I should see the text "Your order number is"
    And I take a screenshot named "new_order_confirmation_page_1.png"

  Scenario: The partner can be able to create a SIP order with 36 Months Commitment Period
    Given I navigate from the dashboard to the "new order service details" page
    When I select the "36 months" option in the "commitment period" dropdown list
    Then I should not see the "Save and continue" button
    When I fill in the "number of channels" input with the text "40"
    When I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    And I take a screenshot named "service_details_2.png"
    And I click the "Save and continue" button
    And I should see the text "Service features"
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_details_2.png"
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    When I click the "Confirm Order" button
    And I wait for 1 second
    And I wait for page to load
    Then I should be on the "new order confirmation" page
    And I should see the text "Your order number is"
    And I take a screenshot named "new_order_confirmation_page_2.png"

  Scenario: The partner can be able to select 12 Months Commitment Period and validate Order Summary Page
    Given I navigate from the dashboard to the "new order service details" page
    When I select the "12 months" option in the "commitment period" dropdown list
    Then I should not see the "Save and continue" button
    When I fill in the "number of channels" input with the text "250"
    When I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    And I take a screenshot named "service_details_3.png"
    When I click the "Save and continue" button
    Then I should see the text "Service features"
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_details_1.png"
    When I click the "Save and continue" button
    Then I should see the text "Review your order"
    And I should see the text "12 months"
    And I take a screenshot named "summary_commitment_3.png"

  Scenario: The partner can be able to select 36 Months Commitment Period and validate Order Summary Page
    Given I navigate from the dashboard to the "new order service details" page
    When I select the "24 months" option in the "commitment period" dropdown list
    And I select the "36 months" option in the "commitment period" dropdown list
    Then I should not see the "Save and continue" button
    When I fill in the "number of channels" input with the text "45"
    When I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    And I take a screenshot named "service_details_1.png"
    When I click the "Save and continue" button
    Then I should see the text "Service features"
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_details_4.png"
    When I click the "Save and continue" button
    Then I should see the text "Review your order"
    And I should see the text "36 months"
    And I take a screenshot named "summary_commitment_4.png"

  Scenario: The partner can see Save and Continue Button only after Commitment Period Selected
    Given I navigate from the dashboard to the "new order service details" page
    Then I should not see the "Save and continue" button
    When I fill in the "number of channels" input with the text "45"
    And I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    When I select the "24 months" option in the "commitment period" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "service_details_5.png"
    When I select the "36 months" option in the "commitment period" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "service_details1_5.png"

#  Scenario: The partner could not see Save and Continue Button without Commitment Period Selected
#    Given I navigate from the dashboard to the "new order service details" page
#    Then I should not see the "Save and continue" button
#    When I fill in the "number of channels" input with the text "45"
#    And I click the "I only need Outbound calls" radio button
#    Then I should not see the "Save and continue" button
#    And I take a screenshot named "service_details_6.png"