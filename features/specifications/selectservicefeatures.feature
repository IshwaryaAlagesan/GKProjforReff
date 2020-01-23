@ECS-430 @VSTS-47652
Feature: ECS-430 -- Select Service Features

  Rules:
  1.  Validate all the default options pre selected in the Select Services Features
  2.  Partner Selects CLIR and All Premium Rate Services options
  3.  Partner Selects CLIP and Except Emergency Services options
  4.  Partner Selects CLIR and International Calls Only
  5.  Partner Selects CLIR and Premium Rate Service Only
  6.  Partner Selects CLIP and Directory Enquiries Only
  7.  Partner could not see Save and Continue, if not atleast one Service Features selected

  Background:
    Given I log in as a partner

#  @1
  Scenario: Validate all the default options pre selected in the Select Services Features
    Given I navigate from the dashboard to the "new order service features" page
    Then I should see the text "2" in the "number type" section
    And the "no barring" checkbox should be checked
    But the "international calls" checkbox should not be checked
    And the "premium rate services" checkbox should not be checked
    And the "directory enquiries" checkbox should not be checked
    And the "all calls except emergency numbers" checkbox should not be checked
    And I take a screenshot named "service_features_defaults.png"

#  @2
  Scenario: Partner can select CLIR and All Premium Rate Services options
    Given I navigate from the dashboard to the "new order service features" page
    And I click the "CLIR" button
    And I click the "international calls" checkbox
    And I click the "premium rate services" checkbox
    And I click the "directory enquiries" checkbox
    Then the "no barring" checkbox should not be checked
    And the "all calls except emergency numbers" checkbox should not be checked
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_2.png"

#  @3
  Scenario: Partner can select CLIP and Except Emergency Services options
    Given I navigate from the dashboard to the "new order service features" page
    And I click the "CLIR" button
    And I click the "CLIP" button
    And I click the "all calls except emergency numbers" checkbox
    Then the "no barring" checkbox should not be checked
    And the "international calls" checkbox should not be checked
    And the "premium rate services" checkbox should not be checked
    And the "directory enquiries" checkbox should not be checked
    And the "all calls except emergency numbers" checkbox should be checked
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_3.png"

#  @4
  Scenario: Partner can select CLIR and International Calls Only
    Given I navigate from the dashboard to the "new order service features" page
    And I click the "CLIR" button
    And I click the "international calls" checkbox
    Then the "no barring" checkbox should not be checked
    And the "premium rate services" checkbox should not be checked
    And the "directory enquiries" checkbox should not be checked
    And the "all calls except emergency numbers" checkbox should not be checked
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_4.png"

#  @5
  Scenario: Partner can select CLIR and Premium Rate Service Only
    Given I navigate from the dashboard to the "new order service features" page
    And I click the "premium rate services" checkbox
    Then the "no barring" checkbox should not be checked
    And the "international calls" checkbox should not be checked
    And the "directory enquiries" checkbox should not be checked
    And the "all calls except emergency numbers" checkbox should not be checked
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_5.png"

#  @6
  Scenario: Partner can select CLIP and Directory Enquiries Only
    Given I navigate from the dashboard to the "new order service features" page
    And I click the "CLIR" button
    And I click the "CLIP" button
    And I click the "directory enquiries" checkbox
    Then the "no barring" checkbox should not be checked
    And the "international calls" checkbox should not be checked
    And the "premium rate services" checkbox should not be checked
    And the "all calls except emergency numbers" checkbox should not be checked
    And I should see the "Save and continue" button
    And I take a screenshot named "service_features_6.png"

#  @7
  Scenario: Partner could not see Save and Continue, if not atleast one Service Features selected
    Given I navigate from the dashboard to the "new order service features" page
    And I should see the "Save and continue" button
    When I click the "no barring" checkbox
    And I click the "international calls" checkbox
    And I click the "international calls" checkbox
    Then the "no barring" checkbox should not be checked
    And I should not see the "Save and continue" button
    And I take a screenshot named "service_features_71.png"
    When I click the "international calls" checkbox
    Then I should see the "Save and continue" button
    When I click the "international calls" checkbox
    Then the "international calls" checkbox should not be checked
    And I should not see the "Save and continue" button
    And I take a screenshot named "service_features_72.png"
    When I click the "premium rate services" checkbox
    Then I should see the "Save and continue" button
    When I click the "premium rate services" checkbox
    Then the "premium rate services" checkbox should not be checked
    And I should not see the "Save and continue" button
    And I take a screenshot named "service_features_73.png"
    When I click the "directory enquiries" checkbox
    Then I should see the "Save and continue" button
    When I click the "directory enquiries" checkbox
    Then the "directory enquiries" checkbox should not be checked
    And I should not see the "Save and continue" button
    And I take a screenshot named "service_features_74.png"
    When I click the "all calls except emergency numbers" checkbox
    Then I should see the "Save and continue" button
    When I click the "all calls except emergency numbers" checkbox
    And I click the "international calls" checkbox
    And I click the "international calls" checkbox
    Then the "all calls except emergency numbers" checkbox should not be checked
    And I should not see the "Save and continue" button
    And I take a screenshot named "service_features_75.png"


