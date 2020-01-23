@ECS-1596 @VSTS-48239
Feature: ECS-1596 -- Order Summary Page

  Rules:
  1.  The partner can verify all of their entries and selections on a summary page before placing the order
  2. - Business details section
  3. - Service details section
  4. - Service features section
  5. - Change New Number and check the section

  Background:
    Given I log in as a partner

  Scenario: Verify the information in the summary page - All the sections
    Given I navigate from the dashboard to the "new order summary" page
    Then I should see the text of "New Company Ltd" in the "//div[contains(text(),'Business name')]/following-sibling::div[1]" segment
    And I should see the text of "Holiday Inn Express, Grenoble Road, OXFORD, , OX4 4XP" in the "//div[contains(text(),'Address')]/following-sibling::div[1]" segment
    And I should see the text of "Avaya" in the "//div[contains(text(),'PBX make')]/following-sibling::div[1]" segment
    And I should see the text of "Call Manager" in the "//div[contains(text(),'PBX model')]/following-sibling::div[1]" segment
    And I should see the text of "6.3" in the "//div[contains(text(),'Software version')]/following-sibling::div[1]" segment
    And I should see the text of "12 months" in the "//div[contains(text(),'Commitment period')]/following-sibling::div[1]" segment
    And I should see the text of "60" in the "//div[contains(text(),'Number of channels')]/following-sibling::div[1]" segment
    And I should see the text of "CLIP" in the "//div[contains(text(),'Presentation number availability')]/following-sibling::div[1]" segment
    And I should see the text of "2" in the "//div[contains(text(),'Presentation number type')]/following-sibling::div[1]" segment
    And I should see the text of "No barring" in the "//div[contains(text(),'Call barring')]/following-sibling::div[1]" segment
    And I take a screenshot named "Order-Summary-Page.png"

  Scenario: Verify the information in the summary page - Edit and Verify business details section
    Given I navigate from the dashboard to the "new order summary" page
    Then I should see the text "New Company Ltd" in the "Business name" field
    And I should see the text "Avaya" in the "PBX make" field
    And I should see the text "Call Manager" in the "PBX model" field
    And I should see the text "6.3" in the "Software version" field
    When I click the "edit" link in the "business-details" section at summary page
    Then I should be on the "new order business details edit" page
    When I select the "7" option in the "version" dropdown list
    And I click the "Save and continue" button
    Then I should be on the "new order summary" page
    And I should see the text "7" in the "Software version" field
    And I should not see the text "6.3" in the "Software version" field
    And I take a screenshot named "Order-Summary-Page_2.png"

  Scenario: Verify the information in the summary page - Edit and Verify service details section
    Given I navigate from the dashboard to the "new order summary" page
    Then I should see the text "12 months" in the "Commitment period" field
    And I should see the text "60" in the "Number of channels" field
#    And I should see the text "30" in the "service details" section
#    And I should see the text "012 3123 4450 - 9" in the "service details" section
#    And I should see the text "012 3123 4480 - 99" in the "service details" section
#    And I should see the text "012 3123 4500 - 70" in the "service details" section
    When I click the "edit" link in the "service-details" section at summary page
    Then I should be on the "new order service details edit" page
    When I select the "36 months" option in the "commitment period" dropdown list
    And I click the "Save and continue" button
    Then I should be on the "new order summary" page
    And I should see the text "36 months" in the "Commitment period" field
    And I should not see the text "12 months" in the "Commitment period" field
    And I take a screenshot named "Order-Summary-Page_3.png"

  Scenario: Verify the information in the summary page - Edit and Verify service features section
    Given I navigate from the dashboard to the "new order summary" page
    Then I should see the text "CLIP" in the "Presentation number availability" field
    And I should see the text "2" in the "Presentation number type" field
    And I should see the text "No barring" in the "Call barring" field
    When I click the "edit" link in the "service-features" section at summary page
    Then I should be on the "new order service features edit" page
    When I click the "CLIR" button
    And I click the "Save and continue" button
    Then I should be on the "new order summary" page
    And I should see the text "CLIR" in the "Presentation number availability" field
    And I should not see the text "CLIP" in the "Presentation number availability" field
    And I take a screenshot named "Order-Summary-Page_4.png"

#  @5
  Scenario: Verify the information in the summary page - New numbers reserved
    Given I navigate from the dashboard to the "new order summary" page
#    Then I should see the text "012 3123 4450 - 9" in the "service details" section
#    And I should see the text "012 3123 4480 - 99" in the "service details" section
#    And I should see the text "012 3123 4500 - 70" in the "service details" section
    When I click the "edit" link in the "service-details" section at summary page
    Then I should be on the "new order service details edit" page
#    Then I should see the "amount of numbers needed" input
#    When I fill in the "amount of numbers needed" input with the text "35"
    When I click the "Save and continue" button
    Then I should be on the "new order summary" page
#    And I should see the text "012 3123 4450 - 9" in the "service details" section
#    And I should see the text "012 3123 4480 - 99" in the "service details" section
#    And I should see the text "012 3123 4500 - 70" in the "service details" section
    And I take a screenshot named "Order-Summary-Page_5.png"

