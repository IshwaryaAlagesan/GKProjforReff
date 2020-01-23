@ECS-429 @VSTS-47650
Feature: ECS-429 -- Select Number of channels (Feature)
  In order for Vodafone to recieve a new SIP order online
  As a partner
  I need to be able to provide all required information using user friendly forms with Trunk Only Order

  Rules:
    1    Partner can be able to see No. of Channels in the Service details page
    2    Partner can be able to see No. of channels value is "8" by default
    3    Partner can be able to create a successful SIP order with minimum channel number "8"
    4    Partner can be able to create a successful SIP order with maximum channel number "250"
    5    Partner can be able to create a successful SIP order with channel number "9"
    6    Partner can be able to create a successful SIP order with channel number "249"
    7    Partner should see the Error Message when No. of channels is < 8 - "7"
    8    Partner should see the Error Message when No. of channels is > 250 - "251"
    9    Partner should not see save and continue button when No. of channels is < 8 - '5'
    10   Partner should not see save and continue button when No. of channels is > 250 - '700'


  Background:
    Given I log in as a partner


  Scenario: Partner can be able to see No. of Channels in the Service details page
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the "Save and continue" button
    And I should see the "number of channels" button
    And I take a screenshot named "Channel number_1.png"

  @CreateSIPOrderwithMinimumChannels
  Scenario: Partner can be able to see No. of channels value is "8" by default
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the "Save and continue" button
    And I should see the "number of channels" button
    When I select the "12 months" option in the "commitment period" dropdown list
    Then I should see the "Save and continue" button
    Then I should see the text "8"
#    Then I should see the text of "8" in the "//input[@id='numberOfChannels']" segment
    And I take a screenshot named "Channel number_2.png"


#  @CreateSIPOrderwithMinimumChannels
  Scenario: Partner can be able to create a successful SIP order with minimum channel number "8"
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the "Save and continue" button
    And I should see the "number of channels" button
    When I select the "12 months" option in the "commitment period" dropdown list
    Then I should see the "Save and continue" button
    When I fill in the "number of channels" input with the text "8"
    Then I should see the "Save and continue" button
    And I take a screenshot named "Channel number_31.png"
    When I click the "I only need Outbound calls" radio button
    And I click the "Save and continue" button
    Then I should see the text "Service features"
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    And I take a screenshot named "Channel number_32.png"

  Scenario: Partner can be able to create a successful SIP order with maximum channel number "250"
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the "Save and continue" button
    And I should see the "number of channels" button
    When I select the "12 months" option in the "commitment period" dropdown list
    Then I should see the "Save and continue" button
    When I fill in the "number of channels" input with the text "250"
    Then I should see the "Save and continue" button
    And I take a screenshot named "Channel number_41.png"
    When I click the "I only need Outbound calls" radio button
    And I click the "Save and continue" button
    Then I should see the text "Service features"
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    And I take a screenshot named "Channel number_42.png"

  Scenario: Partner can be able to create a successful SIP order with channel number "9"
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the "Save and continue" button
    And I should see the "number of channels" button
    When I select the "12 months" option in the "commitment period" dropdown list
    Then I should see the "Save and continue" button
    When I fill in the "number of channels" input with the text "9"
    Then I should see the "Save and continue" button
    And I take a screenshot named "Channel number_51.png"
    When I click the "I only need Outbound calls" radio button
    And I click the "Save and continue" button
    Then I should see the text "Service features"
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    And I take a screenshot named "Channel number_52.png"

  Scenario: Partner can be able to create a successful SIP order with channel number "249"
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the "Save and continue" button
    And I should see the "number of channels" button
    When I select the "12 months" option in the "commitment period" dropdown list
    Then I should see the "Save and continue" button
    When I fill in the "number of channels" input with the text "249"
    Then I should see the "Save and continue" button
    And I take a screenshot named "Channel number_61.png"
    When I click the "I only need Outbound calls" radio button
    And I click the "Save and continue" button
    Then I should see the text "Service features"
    And I click the "Save and continue" button
    And I should see the text "Review your order"
    And I take a screenshot named "Channel number_62.png"

#  @CreateSIPOrderInvalidChannels-Greater
  Scenario: Partner should see the Error Message when No. of channels is < 8 - "7"
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the "Save and continue" button
    When I select the "24 months" option in the "commitment period" dropdown list
    And  I fill in the "number of channels" input with the text "7"
    Then I should see the text "Number of channels must be between 8 to 250"
    And I take a screenshot named "Channel-number-7.png"

  Scenario: Partner should see the Error Message when No. of channels is > 250 - "251"
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the "Save and continue" button
    When I select the "24 months" option in the "commitment period" dropdown list
    And I fill in the "number of channels" input with the text "251"
    Then I should see the text "Number of channels must be between 8 to 250"
    And I take a screenshot named "Channel-number-8.png"

  Scenario: Partner should not see save and continue button when No. of channels is < 8 - '5'
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the "Save and continue" button
    When I select the "24 months" option in the "commitment period" dropdown list
    Then I should see the "Save and continue" button
    When I fill in the "number of channels" input with the text "5"
    Then I should not see the "Save and continue" button
    When I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    And I take a screenshot named "Channel-number-9.png"

  Scenario: Partner should not see save and continue button when No. of channels is > 250 - '700'
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the "Save and continue" button
    When I select the "24 months" option in the "commitment period" dropdown list
    Then I should see the "Save and continue" button
    When I fill in the "number of channels" input with the text "700"
    Then I should not see the "Save and continue" button
    When I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button
    And I take a screenshot named "Channel-number-10.png"
  