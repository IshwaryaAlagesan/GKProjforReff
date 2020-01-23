@ECS-814 @VSTS-51726
Feature: ECS-814 -- Portal Validated and Submit order

  Background:
    Given I log in as a partner

  Scenario: The partner can create SIP Order - Trunk Only Order - PBX - Yes
  Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Submit Order 1"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.2" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_page.png"
    Then I click the "Save and continue" button
    And I should see the text "Service details"
    When I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
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
    And I take a screenshot named "new_order_confirmation_page.png"

  Scenario: The partner can create SIP Order - Trunk Only Order - PBX - No
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Submit Order 1"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "No" button
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_page.png"
    Then I click the "Save and continue" button
    And I should see the text "Service details"
    When I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
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
    And I take a screenshot named "new_order_confirmation_page.png"

  Scenario: The partner can create SIP Order - Trunk Only Order - Commitment Period - 24 Months
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Submit Order 1"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.2" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_page.png"
    Then I click the "Save and continue" button
    And I should see the text "Service details"
    When I select the "24 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
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
    And I take a screenshot named "new_order_confirmation_page.png"

  Scenario: The partner can create SIP Order - Trunk Only Order - No of Channels - 250
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Submit Order 1"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.2" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_page.png"
    Then I click the "Save and continue" button
    And I should see the text "Service details"
    When I select the "24 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "250"
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
    And I take a screenshot named "new_order_confirmation_page.png"

  Scenario: The partner can create SIP Order - Trunk Only Order - Presentation Type - CLIR
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Submit Order 1"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.2" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_page.png"
    Then I click the "Save and continue" button
    And I should see the text "Service details"
    When I select the "24 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    And I take a screenshot named "service_details_1.png"
    And I click the "Save and continue" button
    And I should see the text "Service features"
    And I click the "CLIR" button
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_details_1.png"
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    When I click the "Confirm Order" button
    And I wait for 1 second
    And I wait for page to load
    Then I should be on the "new order confirmation" page
    And I should see the text "Your order number is"
    And I take a screenshot named "new_order_confirmation_page.png"

  Scenario: The partner can create SIP Order - Trunk Only Order - Call barring - No Barring
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Submit Order 1"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.2" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_page.png"
    Then I click the "Save and continue" button
    And I should see the text "Service details"
    When I select the "24 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
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
    And I take a screenshot named "new_order_confirmation_page.png"

  Scenario: The partner can create SIP Order - Trunk Only Order - Call Barring - International and Premium
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Submit Order 1"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.2" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_page.png"
    Then I click the "Save and continue" button
    And I should see the text "Service details"
    When I select the "24 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    And I take a screenshot named "service_details_1.png"
    And I click the "Save and continue" button
    And I should see the text "Service features"
    And I click the "international calls" checkbox
    And I click the "premium rate services" checkbox
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_details_1.png"
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    When I click the "Confirm Order" button
    And I wait for 1 second
    And I wait for page to load
    Then I should be on the "new order confirmation" page
    And I should see the text "Your order number is"
    And I take a screenshot named "new_order_confirmation_page.png"

  Scenario: The partner can create SIP Order - Trunk Only Order - Call Barring - International, Premium and Direct Enquiries
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Submit Order 1"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.2" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_page.png"
    Then I click the "Save and continue" button
    And I should see the text "Service details"
    When I select the "24 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    And I take a screenshot named "service_details_1.png"
    And I click the "Save and continue" button
    And I should see the text "Service features"
    And I click the "international calls" checkbox
    And I click the "premium rate services" checkbox
    And I click the "directory enquiries" checkbox
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_details_1.png"
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    When I click the "Confirm Order" button
    And I wait for 1 second
    And I wait for page to load
    Then I should be on the "new order confirmation" page
    And I should see the text "Your order number is"
    And I take a screenshot named "new_order_confirmation_page.png"

  Scenario: The partner can create SIP Order - Trunk Only Order - Call Barring - All calls except emergency numbers
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Submit Order 1"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.2" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_page.png"
    Then I click the "Save and continue" button
    And I should see the text "Service details"
    When I select the "24 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    And I take a screenshot named "service_details_1.png"
    And I click the "Save and continue" button
    And I should see the text "Service features"
    And I click the "all calls except emergency numbers" checkbox
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_details_1.png"
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    When I click the "Confirm Order" button
    And I wait for 1 second
    And I wait for page to load
    Then I should be on the "new order confirmation" page
    And I should see the text "Your order number is"
    And I take a screenshot named "new_order_confirmation_page.png"

