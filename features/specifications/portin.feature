@ECS-449 @VSTS-51514
Feature: ECS-449 -- Port IN Numbers
  As a Partner
  I need to be able to Port IN Numbers from SIP Portal UI

  Rules:
    1.  Partner can be able to see the Port IN options in the Service Details page
    2.  Partner can be able to successfully Validate single number Port IN
    3.  Partner can be able to successfully validate single Range Port IN
    4.  Partner can be able to successfully validate Single number and single range Port IN
    5.  Partner can be able to successfully validate single number Port IN with New Numbers
    6.  Partner could not be allowed to Port IN, If not single number is Portable
    7.  Partner could not be allowed to Port IN, If Activation date not selected
    8.  Partner can be able to see Proper Error message, if Non Portable
    9.  Partner can be able to see Proper Error message, if Range Not Found
    10. Partner could not be allowed to Port IN, If Service Provider Not selected


  Background:
    Given I log in as a partner


  Scenario: Partner can be able to see the Port IN options in the Service Details page
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
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
    And I take a screenshot named "postcode_entry.png"
    When I click the "Save and continue" button
    And I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "port numbers" checkbox
    And I should see the text "Porting requests are processed against a single"
    And I should see the text "Service provider"
    And I should see the text "Desirable activation date"
    And I should see the text "Billing number"
    And I should see the text "Port this billing number"
    And I should see the text "Single numbers"
    And I should see the text "Number ranges"
    And I take a screenshot named "Port-in1.png"

  Scenario: Partner can be able to successfully Validate single number Port IN
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "No" button
    Then I should see the "Save and continue" button
    And I take a screenshot named "postcode_entry.png"
    When I click the "Save and continue" button
    And I click the "port numbers" checkbox
    And I select the "BT" option in the "service provider" dropdown list
    And I fill in the "billing number0" input with the text "0123456789"
    And I click the "port-billing-number-0" checkbox
    And I click the "validate-numbers" button
    And I wait for 5 second
    And I wait for the element "//div[contains(@class,'vfuk-Notification__content')]//p[contains(@class,'')]"
    And I should see the text "We cannot port these ranges. Please contact your Account Manager to discuss."
    And I fill in the "Single number0" input with the text "0123456789"
    And I fill in the "number range from0" input with the text "0123456789"
    And I fill in the "number range to0" input with the text "0123456790"
    And I take a screenshot named "portin2.png"

  Scenario: Partner can be able to successfully validate single Range Port IN
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "OX44XP"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "No" button
    Then I should see the "Save and continue" button
    And I take a screenshot named "postcode_entry.png"
    When I click the "Save and continue" button
    And I click the "port numbers" checkbox
    And I select the "BT" option in the "service provider" dropdown list
    And I fill in the "billing number0" input with the text "0123456789"
    And I fill in the "number range from0" input with the text "0123456789"
    And I fill in the "number range to0" input with the text "0123456790"
    And I click the "validate-numbers" button
    And I take a screenshot named "portin3.png"
    
#    And I fill in the "amount of new numbers" input with the text "10"
#    Then I should not see the "Save and continue" button
#    And I click the "Reserve" button
#    And I wait for 5 seconds
##    And I wait for page to load
#    And I wait for the element "//div[@class='vfuk-Notification__content']"
#    And I should see the text "We have successfully reserved 10 new numbers for you."
##    And I should see the text "We have successfully reserved"
#    And I should not see the text "We are unable to progress your request for new numbers"
#    Then I should see the "Save and continue" button
#    And I take a screenshot named "reserve_numbers.png"
#    When I click the "Save and continue" button
#    Then I should see the text "Select Service Features"
#    And I should see the "Save and continue" button
#    When I click the "Save and continue" button
#    Then I should see the text "Review your Order"
##    And I should see the text "01733 458 001 - 010" in the "port new numbers" section
#    And I take a screenshot named "reserved_numbers.png"
##    And I should see the text "012 3123 4480 - 99" in the "port new numbers" section
##    And I should see the text "012 3123 4500 - 70" in the "port new numbers" section



#  Scenario: Partner able to successfully Reserve Single Increment Number - "11"
#    Given I navigate from the dashboard to the "new order business details" page
#    When I fill in the "business name" input with the text "Some Company Ltd"
#    And I fill in the "postcode" input with the text "OX44XP"
#    And I click the "Find" button
#    And I wait for 1 second
#    Then I should see the "address" dropdown list
#    When I select the "0" option in the "address" dropdown list
#    And I click the "Yes" button
#    Then I should see the text "What is the PBX's make"
#    When I select the "Avaya" option in the "make" dropdown list
#    And I select the "Call Manager" option in the "model" dropdown list
#    And I select the "6.2" option in the "version" dropdown list
#    Then I should see the "Save and continue" button
#    And I take a screenshot named "postcode_entry.png"
#    When I click the "Save and continue" button
#    And I select the "12 months" option in the "commitment period" dropdown list
#    And I fill in the "number of channels" input with the text "50"
#    And I click the "new numbers" checkbox
#    And I fill in the "amount of new numbers" input with the text "11"
#    Then I should not see the "Save and continue" button
#    And I click the "Reserve" button
#    And I wait for 15 seconds
#    And I wait for the element "//div[@class='vfuk-Notification__content']"
#    And I should see the text "We have successfully reserved 11 new numbers for you."
#    And I should not see the text "We are unable to progress your request for new numbers"
#    Then I should see the "Save and continue" button
#    And I take a screenshot named "reserve_numbers.png"
#    When I click the "Save and continue" button
#    Then I should see the text "Service features"
#    And I should see the "Save and continue" button
#    When I click the "Save and continue" button
#    Then I should see the text "Review your order"
#    And I take a screenshot named "reserved_numbers.png"
