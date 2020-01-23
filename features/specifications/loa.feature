@ECS-5487 @VSTS-70217
Feature: ECS-5487 -- LoA for Port IN Orders
  As a Partner
  I need to be able to acknowledge LoA Port IN Orders from SIP Portal UI

  Rules:
    1.  Partner can be able to see the LoA option for the Port IN single range Order
    2.  Partner can be able to see the LoA option for the Two Number Port IN Order
    3.  Partner can be able to see the LoA option for the Single Billing Number and Single Range Port IN Order
    4.  Partner should not see LoA option for the single number Port IN Order
    5.  Partner should not see LoA option for the single Billing number Port IN Order
    6   Partner should not see LoA option for Trunk Only Order
    7.  Partner should not see LoA option for New Number Only Order
    8.  Partner should not see LoA option for New Number + Single Number Port IN Order

  Background:
    Given I log in as a partner

  Scenario: Partner can be able to see the LoA option for the Port IN single range Order
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "No" button
    When I click the "Save and continue" button
    And I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "port numbers" checkbox
    And I select the "BT" option in the "service provider" dropdown list
    And I fill in the "billing number0" input with the text "01132001420"
#    And I click the "port-billing-number-0" checkbox
#    And I fill in the "Single number0" input with the text "0123456789"
    And I fill in the "number range from0" input with the text "01132001421"
    And I fill in the "number range to0" input with the text "01132001422"
    And I click the "validate-numbers" button
#    And I wait for the element "//span[contains(text(),'Save and continue')]"
    And I wait for the element "#saveAndContinue button, button[data-selector='saveAndContinue']"
    And I should see the "save and continue" button
    And I click the "save and continue" button
    And I should see the "Save and continue" button
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    And I should see the text "I confirm that I have obtained a signed Letter of Authority from my customer"
    And I should not see the "Confirm order" button
    And I click the "//span[@class='vfuk-Checkbox__text']" element
    And I should see the "Confirm order" button
    And I take a screenshot named "loa1.png"

  Scenario: Partner can be able to see the LoA option for the Two Number Port IN Order
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "No" button
    When I click the "Save and continue" button
    And I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "port numbers" checkbox
    And I select the "BT" option in the "service provider" dropdown list
    And I fill in the "billing number0" input with the text "01132001420"
#    And I click the "port-billing-number-0" checkbox
    And I fill in the "Single number0" input with the text "01132001421"
    And I click the "//div[contains(@class,'vfuk-SingleNumber__single-number')]//button[2]" element
    And I fill in the "Single number1" input with the text "01132001422"
  #    And I fill in the "number range from0" input with the text "01234000001"
#    And I fill in the "number range to0" input with the text "01234000002"
    And I click the "validate-numbers" button
    And I wait for the element "#saveAndContinue button, button[data-selector='saveAndContinue']"
    And I should see the "Save and continue" button
    And I click the "Save and continue" button
    And I should see the "Save and continue" button
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    And I should see the text "I confirm that I have obtained a signed Letter of Authority from my customer"
    And I should not see the "Confirm order" button
    And I click the "//span[@class='vfuk-Checkbox__text']" element
    And I should see the "Confirm order" button
    And I take a screenshot named "loa2.png"

Scenario: Partner can be able to see the LoA option for the Single Billing Number and Single Range Port IN Order
  Given I navigate from the dashboard to the "new order business details" page
  When I fill in the "business name" input with the text "Some Company Ltd"
  And I fill in the "postcode" input with the text "OX44XP"
  And I click the "Find" button
  And I wait for 1 second
  Then I should see the "address" dropdown list
  When I select the "0" option in the "address" dropdown list
  And I click the "No" button
  When I click the "Save and continue" button
  And I select the "12 months" option in the "commitment period" dropdown list
  And I fill in the "number of channels" input with the text "50"
  And I click the "port numbers" checkbox
  And I select the "BT" option in the "service provider" dropdown list
  And I fill in the "billing number0" input with the text "02037381195"
  And I click the "port-billing-number-0" checkbox
#  And I fill in the "Single number0" input with the text "01234000001"
  And I fill in the "number range from0" input with the text "02037381196"
  And I fill in the "number range to0" input with the text "02037381197"
  And I click the "validate-numbers" button
  And I wait for the element "#saveAndContinue button, button[data-selector='saveAndContinue']"
  And I should see the "Save and continue" button
  And I click the "Save and continue" button
  And I should see the "Save and continue" button
  And I click the "Save and continue" button
  And I should see the text "Review your order"
  And I should see the text "I confirm that I have obtained a signed Letter of Authority from my customer"
  And I should not see the "Confirm order" button
  And I click the "//span[@class='vfuk-Checkbox__text']" element
  And I should see the "Confirm order" button
  And I take a screenshot named "loa3.png"

Scenario: Partner should not see LoA option for the single number Port IN Order
  Given I navigate from the dashboard to the "new order business details" page
  When I fill in the "business name" input with the text "Some Company Ltd"
  And I fill in the "postcode" input with the text "OX44XP"
  And I click the "Find" button
  And I wait for 1 second
  Then I should see the "address" dropdown list
  When I select the "0" option in the "address" dropdown list
  And I click the "No" button
  When I click the "Save and continue" button
  And I select the "12 months" option in the "commitment period" dropdown list
  And I fill in the "number of channels" input with the text "50"
  And I click the "port numbers" checkbox
  And I select the "BT" option in the "service provider" dropdown list
  And I fill in the "billing number0" input with the text "02037381195"
#  And I click the "port-billing-number-0" checkbox
  And I fill in the "Single number0" input with the text "02037381196"
#  And I fill in the "number range from0" input with the text "01234000001"
#  And I fill in the "number range to0" input with the text "01234000002"
  And I click the "validate-numbers" button
  And I wait for the element "#saveAndContinue button, button[data-selector='saveAndContinue']"
  And I should see the "Save and continue" button
  And I click the "Save and continue" button
  And I should see the "Save and continue" button
  And I click the "Save and continue" button
  And I should see the text "Review your order"
  And I should not see the text "I confirm that I have obtained a signed Letter of Authority from my customer"
  And I should see the "Confirm order" button
  And I take a screenshot named "loa4.png"

  Scenario: Partner should not see LoA option for the single Billing number Port IN Order
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "No" button
    When I click the "Save and continue" button
    And I wait for "Commitment period" text
    And I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "port numbers" checkbox
    And I select the "BT" option in the "service provider" dropdown list
    And I fill in the "billing number0" input with the text "02037381195"
    And I click the "port-billing-number-0" checkbox
#    And I fill in the "Single number0" input with the text "01234000001"
#  And I fill in the "number range from0" input with the text "01234000001"
#  And I fill in the "number range to0" input with the text "01234000002"
    And I click the "validate-numbers" button
    And I wait for the element "#saveAndContinue button, button[data-selector='saveAndContinue']"
    And I should see the "Save and continue" button
    And I click the "Save and continue" button
    And I should see the "Save and continue" button
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    And I should not see the text "I confirm that I have obtained a signed Letter of Authority from my customer"
    And I should see the "Confirm order" button
    And I take a screenshot named "loa5.png"

  Scenario: Partner should not see LoA option for Trunk Only Order
  Given I navigate from the dashboard to the "new order business details" page
  When I fill in the "business name" input with the text "Some Company Ltd"
  And I fill in the "postcode" input with the text "EH12 0AD"
  And I click the "Find" button
  And I wait for 1 second
  Then I should see the "address" dropdown list
  When I select the "0" option in the "address" dropdown list
  And I click the "No" button
  When I click the "Save and continue" button
  And I select the "12 months" option in the "commitment period" dropdown list
  And I fill in the "number of channels" input with the text "50"
  And I click the "I only need Outbound calls" radio button
  And I should see the "Save and continue" button
  And I click the "Save and continue" button
  And I should see the "Save and continue" button
  And I click the "Save and continue" button
  And I should see the text "Review your order"
  And I should not see the text "I confirm that I have obtained a signed Letter of Authority from my customer"
  And I should see the "Confirm order" button
  And I take a screenshot named "loa6.png"

Scenario: Partner should not see LoA option for New Number Only Order
  Given I navigate from the dashboard to the "new order business details" page
  When I fill in the "business name" input with the text "Some Company Ltd"
  And I fill in the "postcode" input with the text "OX44XP"
  And I click the "Find" button
  And I wait for 1 second
  Then I should see the "address" dropdown list
  When I select the "0" option in the "address" dropdown list
  And I click the "No" button
  When I click the "Save and continue" button
  And I select the "12 months" option in the "commitment period" dropdown list
  And I fill in the "number of channels" input with the text "50"
  And I click the "new numbers" checkbox
  And I fill in the "amount of new numbers" input with the text "10"
  And I click the "//span[contains(text(),'Reserve')]" element
  # And I wait for 15 seconds
  And I wait for the element "//div[@class='vfuk-Notification__content']"
  And I should see the text "We have successfully reserved 10 new numbers for you."
  And I should see the "Save and continue" button
  And I click the "Save and continue" button
  And I should see the "Save and continue" button
  And I click the "Save and continue" button
  And I should see the text "Review your order"
  And I should not see the text "I confirm that I have obtained a signed Letter of Authority from my customer"
  And I should see the "Confirm order" button
  And I take a screenshot named "loa7.png"

Scenario: Partner should not see LoA option for New Number + Single Number Port IN Order
  Given I navigate from the dashboard to the "new order business details" page
  When I fill in the "business name" input with the text "Some Company Ltd"
  And I fill in the "postcode" input with the text "OX44XP"
  And I click the "Find" button
  And I wait for 1 second
  Then I should see the "address" dropdown list
  When I select the "0" option in the "address" dropdown list
  And I click the "No" button
  When I click the "Save and continue" button
  And I select the "12 months" option in the "commitment period" dropdown list
  And I fill in the "number of channels" input with the text "50"
  And I click the "new numbers" checkbox
  And I fill in the "amount of new numbers" input with the text "10"
  And I click the "//span[contains(text(),'Reserve')]" element
  # And I wait for 15 seconds
  And I wait for the element "//div[@class='vfuk-Notification__content']"
  And I should see the text "We have successfully reserved 10 new numbers for you."
  And I click the "port numbers" checkbox
  And I select the "BT" option in the "service provider" dropdown list
  And I fill in the "billing number0" input with the text "02037381195"
  And I click the "port-billing-number-0" checkbox
  And I click the "validate-numbers" button
  And I wait for the element "#saveAndContinue button, button[data-selector='saveAndContinue']"
  And I should see the "Save and continue" button
  And I click the "Save and continue" button
  And I should see the "Save and continue" button
  And I click the "Save and continue" button
  And I should see the text "Review your order"
  And I should not see the text "I confirm that I have obtained a signed Letter of Authority from my customer"
  And I should see the "Confirm order" button
  And I take a screenshot named "loa8.png"