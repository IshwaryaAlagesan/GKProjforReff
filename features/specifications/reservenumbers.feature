@ECS-446 @VSTS-56645
Feature: ECS-446 -- Reserve Numbers
  As a Partner
  I need to be able to reserve Numbers from SIP Portal UI

  Rules:
    1.  Partner can able to successfully Reserve Minimum New Number - "10"
    2.  Partner can able to successfully Reserve Maximum New Number - "10000"
    3.  Partner can able to successfully Reserve Single Increment Number - "11"
    4.  Partner can able to successfully Reserve Single Increment Number - "9999"
    5.  Partner could not be allowed to Reserve New Numbers less than - "<10"
    6.  Partner could not be allowed to Reserve New Numbers Greater than - ">10000"
    7.  Partner can be able to see Proper Error message, if No Range Found
    8.  Partner can be able to see Proper Error message, if No PostCode Found
    9.  Partner can able to successfully Reserve Multi range Numbers - "200"


  Background:
    Given I log in as a partner

  Scenario: Partner able to successfully Reserve Minimum New Number - "10"
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "CB89LF"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.3" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "postcode_entry.png"
    When I click the "Save and continue" button
    And I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "new numbers" checkbox
    And I fill in the "amount of new numbers" input with the text "10"
    Then I should not see the "Save and continue" button
    And I click the "Reserve" button
    And I wait for 15 seconds
#    And I wait for page to load
    And I wait for the element "//div[@class='vfuk-Notification__content']"
    And I should see the text "We have successfully reserved 10 new numbers for you."
#    And I should see the text "We have successfully reserved"
    And I should not see the text "We are unable to progress your request for new numbers"
    Then I should see the "Save and continue" button
    And I take a screenshot named "reserve_numbers.png"
    When I click the "Save and continue" button
    Then I should see the text "Service features"
    And I should see the "Save and continue" button
    When I click the "Save and continue" button
    Then I should see the text "Review your order"
#    And I should see the text "01733 458 001 - 010" in the "port new numbers" section
    And I take a screenshot named "reserved_numbers.png"
#    And I should see the text "012 3123 4480 - 99" in the "port new numbers" section
#    And I should see the text "012 3123 4500 - 70" in the "port new numbers" section

  Scenario: Partner able to successfully Reserve Maximum New Number - "10000" - NOT TESTED
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "CB89LF"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.3" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "postcode_entry.png"
    When I click the "Save and continue" button
    And I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "new numbers" checkbox
    And I fill in the "amount of new numbers" input with the text "10000"
    And I should not see the text "Amount of numbers must be between 10 and 10,000"
    And I take a screenshot named "reserve_numbers.png"


  Scenario: Partner able to successfully Reserve Single Increment Number - "11"
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "CB89LF"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.3" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "postcode_entry.png"
    When I click the "Save and continue" button
    And I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "new numbers" checkbox
    And I fill in the "amount of new numbers" input with the text "11"
    Then I should not see the "Save and continue" button
    And I click the "Reserve" button
    And I wait for 15 seconds
    And I wait for the element "//div[@class='vfuk-Notification__content']"
    And I should see the text "We have successfully reserved 11 new numbers for you."
    And I should not see the text "We are unable to progress your request for new numbers"
    Then I should see the "Save and continue" button
    And I take a screenshot named "reserve_numbers.png"
    When I click the "Save and continue" button
    Then I should see the text "Service features"
    And I should see the "Save and continue" button
    When I click the "Save and continue" button
    Then I should see the text "Review your order"
    And I take a screenshot named "reserved_numbers.png"

  Scenario: Partner able to successfully Reserve Single Increment Number - "9999"
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "CB89LF"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.3" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "postcode_entry.png"
    When I click the "Save and continue" button
    And I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "new numbers" checkbox
    And I fill in the "amount of new numbers" input with the text "999"
    And I should not see the text "Amount of numbers must be between 10 and 10,000"
    And I take a screenshot named "reserve_numbers.png"


  Scenario: Partner could not be allowed to Reserve New Numbers less than - "10"
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "CB89LF"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.3" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "postcode_entry.png"
    When I click the "Save and continue" button
    And I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "new numbers" checkbox
    And I fill in the "amount of new numbers" input with the text "5"
    Then I should not see the "Save and continue" button
    And I take a screenshot named "reserve_numbers.png"

  Scenario: Partner could not be allowed to Reserve New Numbers Greater than - "10000"
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "CB89LF"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.3" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "postcode_entry.png"
    When I click the "Save and continue" button
    And I select the "12 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "50"
    And I click the "new numbers" checkbox
    And I fill in the "amount of new numbers" input with the text "11000"
    Then I should not see the "Save and continue" button
    And I take a screenshot named "reserve_numbers.png"
