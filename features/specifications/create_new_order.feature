@all @create_new_order 
Feature: A partner can place a new SIP order
  In order for Vodafone to recieve a new SIP order online
  As a partner
  I need to be able to provide all required information using user friendly forms

  Rules:
    1.  A partner needs to be logged in to access the new order feature

    2.  The partner must enter their customer's business name and address
    2a. - Either with an address selected from a dropdown list

    3.  The partner must inform Vodafone about their PBX
    3a. - With a known PBX
    3b. - When the PBX is not known and the user agrees to the disclaimer
    3c. - When the PBX is not known and the user does NOT agree to the disclaimer (in which case they cannot proceed with the order online)

    4.  The partner must select their customer's minimum commitment period, which defaults to 36 months

    5.  The partner must enter the number of channels required
    5a. - within the specified range
    5b. - if outside of the specified range then ...

    6.  The partner must indicate whether new, ported or no numbers are required
    6a. - With no numbers required
    6b. - With new numbers required, in which case they enter the number of new numbers required (a minimum of 10 will be allocated)
    6c. - With porting of existing numbers required (not currently available so not implemented yet)

    7.  The partner must select their preferred number presentation, which defaults to CLIP and type 2 (currently only type 2 is available)

    8.  The partner must select which call barring options are relevant, split into mutually exclusive groups:
    8a. - No barring
    8b. - International calls and/or Premium rate services and/or directory enquiries
    8c. - All calls except emergency numbers

    9.  The partner can verify all of their entries and selections on a summary page before placing the order
   10.  This is split into sections for each page of the journey, where "Edit" links take the partner back to the relevant page to update, save and return to the summary page
   10a. - Business details section
   10b. - Service details section
   10c. - Service features section

   11.  Clicking the "confirm order" button on the summary page places the order with Vodafone

   12.  Once the order is submitted the partner is presented with an order confirmation page (containing their order ID), from which they can continue to the "My Orders" page


  Background:
    Given I log in as a partner


  @2 @2a @3a @56564
  Scenario: The partner can search using their customer's postcode and select the relevant address in the dropdown
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I wait for 1 second
    Then I should see the "address" dropdown list
    But I should not see the "address line 1" input
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    But I should not see the "Save and continue" button
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.3" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_details_page_autofill_address.png"

  @2 @3a @56564
  Scenario: The partner can specify their customer's address using a manually entered address
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    And I click the "Can't find the address?" link
    Then I should see the text "If you cannot find your address please contact your account manager in order to progress the order."
    When I select the "0" option in the "address" dropdown list
    And I click the "Yes" button
    Then I should see the text "What is the PBX's make"
    But I should not see the "Save and continue" button
    When I select the "Avaya" option in the "make" dropdown list
    And I select the "Call Manager" option in the "model" dropdown list
    And I select the "6.3" option in the "version" dropdown list
    Then I should see the "Save and continue" button
    And I take a screenshot named "business_details_page_manual_address.png"

  @3 @3b @56564
  Scenario: State that the PBX is not known and agree to the disclaimer
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    When I select the "0" option in the "address" dropdown list
    And I click the "Can't find the address?" link
    Then I should see the text "If you cannot find your address please contact your account manager in order to progress the order."
    And I click the "No" button
    Then I should see the text "I've read and agree with Vodafone's PBX compliance statement and the customer PBX will conform"
    And I should see the "Save and continue" button
    And I take a screenshot named "business_details_page_PBX_not_known_and_agree.png"

  @3 @3c @56564
  Scenario: State that the PBX is not known but do NOT agree to the disclaimer
    Given I navigate from the dashboard to the "new order business details" page
    When I fill in the "business name" input with the text "Some Company Ltd"
    And I fill in the "postcode" input with the text "RG14 2FN"
    And I click the "Find" button
    When I select the "0" option in the "address" dropdown list
    And I click the "Can't find the address?" link
    Then I should see the text "If you cannot find your address please contact your account manager in order to progress the order."
    And I click the "No" button
    Then I should see the text "I've read and agree with Vodafone's PBX compliance statement and the customer PBX will conform"
    When I click the "I do not agree" radio button
    Then I should not see the "Save and continue" button
    And I take a screenshot named "business_details_page_PBX_not_known_and_do_not_agree.png"

  @4 @56867
  Scenario: A partner selects the 12 months commitment period
    Given I navigate from the dashboard to the "new order service details" page
    Then I should not see the "Save and continue" button
    When I select the "12 months" option in the "commitment period" dropdown list
    Then I should still not see the "Save and continue" button

  @5a @6a @56887
  Scenario: Partner enters the number of channels, stating that no numbers are required
    Given I navigate from the dashboard to the "new order service details" page
    Then I should not see the "Save and continue" button
    When I fill in the "number of channels" input with the text "8"
    And I click the "I only need Outbound calls" radio button
    Then I should see the "Save and continue" button

  @5a @6b @56887
  Scenario: Partner enters the number of channels, stating that new numbers are required
    Given I navigate from the dashboard to the "new order service details" page
    Then I should not see the "Save and continue" button
    And I should not see the "amount of new numbers" input
    And the "Yes, I would like to request:" radio button should be selected
    When I fill in the "number of channels" input with the text "8"
    And I click the "new numbers" checkbox
    Then I should see the "amount of new numbers" input
    When I fill in the "amount of new numbers" input with the text "22"
    Then I should not see the "Save and continue" button
    When I click the "reserve" button
    And I should see the text "We have successfully reserved 22 new numbers for you."
    And I should see the "Save and continue" button

  @5b @56887
  Scenario: Partner attempts to enter a number of channels outside of the available range
    Given I navigate from the dashboard to the "new order service details" page
    Then I should not see the text "Number of channels must be between 8 to 250"
    When I fill in the "number of channels" input with the text "7"
    Then I should see the text "Number of channels must be between 8 to 250"
    When I fill in the "number of channels" input with the text "70"
    Then I should not see the text "Number of channels must be between 8 to 250"
    When I fill in the "number of channels" input with the text "700"
    Then I should see the text "Number of channels must be between 8 to 250"

  @7 @8 @8a @8b @8c @56889
  Scenario: Partner selects their number presentation preferences and call barring options
    Given I navigate from the dashboard to the "new order service features" page
    Then the "No barring" checkbox should be checked
    When I click the "CLIR" button
    And I click the "CLIP" button
    And I click the "international calls" checkbox
    And I click the "premium rate services" checkbox
    And I click the "directory enquiries" checkbox
    Then the "International calls" checkbox should be checked
    And the "Premium rate services" checkbox should be checked
    And the "Directory enquiries" checkbox should be checked
    But the "No barring" checkbox should not be checked
    When I click the "all calls except emergency numbers" checkbox
    Then the "All calls except emergency numbers" checkbox should be checked
    But the "International calls" checkbox should not be checked
    And the "Premium rate services" checkbox should not be checked
    And the "Directory enquiries" checkbox should not be checked
    And the "No barring" checkbox should not be checked
    When I click the "no barring" checkbox
    Then the "No barring" checkbox should be checked
    But the "All calls except emergency numbers" checkbox should not be checked
    And the "International calls" checkbox should not be checked
    And the "Premium rate services" checkbox should not be checked
    And the "Directory enquiries" checkbox should not be checked
    And I take a screenshot named "service_features_page.png"

  @10b @56870
  Scenario: Partner can see the new numbers that have been reserved for their customer on the summary page
    Given I navigate from the dashboard to the "new order summary" page
    # Then I should see the text "01733 458 099" in the "service details" section
    # And I should see the text "01733 458 066" in the "service details" section
    # And I should see the text "01733 458 001 - 010" in the "service details" section
    # And I should see the text "01733 458 025 - 031" in the "service details" section
    # And I should see the text "01733 458 071 - 073" in the "service details" section
    And I should see the text "22" in the "Amount of new numbers" field at create order summary page
    When I click the "edit" link in the "service details" section
    Then I should be on the "new order service details edit" page
    When I fill in the "amount of new numbers" input with the text "50"
    Then I should not see the "Save and continue" button
    When I click the "reserve" button
    And I should see the text "We have successfully reserved 50 new numbers for you."
    When I click the "Save and continue" button
    Then I should be on the "new order summary" page
    And I should see the text "50" in the "Amount of new numbers" field at create order summary page
    # And I should see the text "01733 458 099" in the "service details" section
    # And I should see the text "01733 458 066" in the "service details" section
    # And I should see the text "01733 458 001 - 010" in the "service details" section
    # And I should see the text "01733 458 025 - 031" in the "service details" section
    # And I should see the text "01733 458 071 - 073" in the "service details" section

  @9 @10 @10a @56890
  Scenario: Verify the information in the summary page - business details section
    Given I navigate from the dashboard to the "new order summary" page
    Then I should see the text "Some Company Ltd" in the "Business name" field at create order summary page
    And I should see the text "Vodafone House, The Connection, NEWBURY, Berkshire, RG14 2FN" in the "Address" field at create order summary page
    And I should see the text "Avaya" in the "PBX make" field at create order summary page
    And I should see the text "Call Manager" in the "PBX model" field at create order summary page
    And I should see the text "6.3" in the "Software version" field at create order summary page
    When I click the "edit" link in the "business details" section
    Then I should be on the "new order business details edit" page
    When I select the "7" option in the "version" dropdown list
    And I click the "Save and continue" button
    Then I should be on the "new order summary" page
    And I should see the text "7" in the "Software version" field at create order summary page
    And I should not see the text "6.3" in the "Software version" field at create order summary page

  @9 @10 @10b @56890
  Scenario: Verify the information in the summary page - service details section
    Given I navigate from the dashboard to the "new order summary" page
    Then I should see the text "12 months" in the "Commitment period" field at create order summary page
    And I should see the text "60" in the "Number of channels" field at create order summary page
    And I should see the text "22" in the "Amount of new numbers" field at create order summary page
    # And I should see the text "01733 458 099" in the "service details" section
    # And I should see the text "01733 458 066" in the "service details" section
    # And I should see the text "01733 458 001 - 010" in the "service details" section
    # And I should see the text "01733 458 025 - 031" in the "service details" section
    # And I should see the text "01733 458 071 - 073" in the "service details" section
    When I click the "edit" link in the "service details" section
    Then I should be on the "new order service details edit" page
    When I select the "36 months" option in the "commitment period" dropdown list
    And I click the "Save and continue" button
    Then I should be on the "new order summary" page
    And I should see the text "36 months" in the "Commitment period" field at create order summary page
    And  I should not see the text "12 months" in the "Commitment period" field at create order summary page

  @9 @10 @10c @56890
  Scenario: Verify the information in the summary page - service features section
    Given I navigate from the dashboard to the "new order summary" page
    Then I should see the text "CLIP" in the "Presentation number availability" field at create order summary page
    And I should see the text "2" in the "Presentation number type" field at create order summary page
    And I should see the text "No barring" in the "Call barring" field at create order summary page
    When I click the "edit" link in the "service features" section
    Then I should be on the "new order service features edit" page
    When I click the "CLIR" button
    And I click the "Save and continue" button
    Then I should be on the "new order summary" page
    And I should see the text "CLIR" in the "Presentation number availability" field at create order summary page
    And I should not see the text "CLIP" in the "Presentation number availability" field at create order summary page
    And I take a screenshot named "summary_page.png"

  @11 @12 @critical
  Scenario: The partner is presented with a confirmation page when the order is submitted
    Given I navigate from the dashboard to the "new order summary" page
    When I click the "Confirm Order" button
    And I wait for 1 second
    Then I should be on the "new order confirmation" page
    And I should see the text "Your order number is"
    And I take a screenshot named "new_order_confirmation_page.png"
    When I click the "My Orders" button
    Then I should be on the "my orders" page
    And I take a screenshot named "my_orders_page_from_new_order_confirmation.png"
