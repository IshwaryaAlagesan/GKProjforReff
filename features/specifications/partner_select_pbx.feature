@ECS-427 @VSTS-47631
Feature: ECS-427 -- Partner Selects PBX
  Partner able to Select


  Rules:
  1.  Business Page - Know your PBX - Yes/No Button
  2.  Business Page - Select PBX Make/Model/Version
  3.  Business Page - Select PBX Make Unlisted
  4.  Business Page - Select PBX Model Unlisted
  5.  Business Page - Select PBX Version Unlisted
  6.  Business Page - Select PBX Unlisted - Compliance Statement -Yes
  7.  Business Page - Select PBX Unlisted - Compliance Statement -No

  Background:
    Given I log in as a partner

  Scenario: Business Page - Know your PBX - Yes/No Button
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 5 second
    Then I should see the "address" dropdown list
    But I should not see the "a1" input
    When I select the "Vodafone House The Connection" option in the "address" dropdown list
    Then I should see the text "Do you know the customer's PBX?"
    And I should see the "Yes" button
    And I should see the "No" button
    And I take a screenshot named "pbx_yes_no_btn.png"

  Scenario: Business Page - Select PBX Make/Model/Version
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 5 second
    Then I should see the "address" dropdown list
    But I should not see the "a1" input
    When I select the "Vodafone House The Connection" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    But I should not see the "Save and continue" button
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.2" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "select_pbx.png"

  Scenario: Business Page - See PBX Make
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 5 second
    Then I should see the "address" dropdown list
    But I should not see the "a1" input
    When I select the "Vodafone House The Connection" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    And I take a screenshot named "select_pbx.png"

  Scenario: Business Page - See PBX Model
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 5 second
    Then I should see the "address" dropdown list
    But I should not see the "a1" input
    When I select the "Vodafone House The Connection" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's model"
    And I take a screenshot named "select_pbx.png"

  Scenario: Business Page - See PBX Version
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 5 second
    Then I should see the "address" dropdown list
    But I should not see the "a1" input
    When I select the "Vodafone House The Connection" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's software version"
    And I take a screenshot named "select_pbx.png"

  Scenario: Business Page - Select PBX Make Unlisted
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 5 second
    Then I should see the "address" dropdown list
    But I should not see the "a1" input
    When I select the "Vodafone House The Connection" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    But I should not see the "Save and continue" button
    When I select the "Not Listed" option in the "make" dropdown list
    And I take a screenshot named "pbx_make_unlisted.png"

  Scenario: Business Page - Select PBX Model Unlisted
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 5 second
    Then I should see the "address" dropdown list
    But I should not see the "a1" input
    When I select the "Vodafone House The Connection" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    But I should not see the "Save and continue" button
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Not Listed" option in the "model" dropdown list
    And I should see the "iAgree" radio button
    And I should see the "iDoNotAgree" radio button
    And I take a screenshot named "pbx_model_unlisted.png"

  Scenario: Business Page - Select PBX Version Unlisted
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 5 second
    Then I should see the "address" dropdown list
    But I should not see the "a1" input
    When I select the "Vodafone House The Connection" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    But I should not see the "Save and continue" button
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "Not Listed" option in the "version" dropdown list
    And I should see the "iAgree" radio button
    And I should see the "iDoNotAgree" radio button
    And I take a screenshot named "pbx_version_unlisted.png"

  Scenario: Business Page - Select PBX Unlisted - Compliance Statement-Yes
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 5 second
    Then I should see the "address" dropdown list
    But I should not see the "a1" input
    When I select the "Vodafone House The Connection" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    But I should not see the "Save and continue" button
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "Not listed" option in the "version" dropdown list
    And I should see the "iAgree" radio button
    And I should see the "iDoNotAgree" radio button
    Then I should see the "Save and continue" button
    When I click the element "//div[@id='iDoNotAgree']"
    When I click the element "//input[@value='no']"
    Then I should not see the "Save and continue" button
#    When I click the "iAgree" radio button
    When I click the element "//input[@value='yes']"
    Then I should see the "Save and continue" button
    And I take a screenshot named "compliance_yes.png"

  Scenario: Business Page - Select PBX Unlisted - Compliance Statement-No
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 5 second
    Then I should see the "address" dropdown list
    But I should not see the "a1" input
    When I select the "Vodafone House The Connection" option in the "address" dropdown list
    And I click the "No" button
    Then I should see the text "Vodafone performs interoperability testing with a range of PBX models and maintains a list of those that pass accreditation for connection to the network. Additionally, Vodafone publishes a compliance statement (based on SIP Connect 2.0)"
    And I should see the "Save and continue" button
    And I should see the "iAgree" radio button
    And I should see the "iDoNotAgree" radio button
    When I click the element "//div[@id='iDoNotAgree']"
    Then I should not see the "Save and continue" button
#    When I click the element "//span[contains(text(),'No')]"
    And I take a screenshot named "compliance_no.png"

