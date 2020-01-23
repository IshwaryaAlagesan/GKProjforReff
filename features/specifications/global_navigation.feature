@ECS-890 @VSTS-64033
Feature: ECS-890 -- Global Navigation Banner

  Rules:
    1.  Partner can able to navigate through out the menu bar options

  Background:
    Given I log in as a partner

  Scenario: Partner should be on the Landing page when Login to SIP Portal
    Given I should be on the "home" page
    When I should see the text of "Welcome, to Vodafone Business Portal" in the "//h1" segment
    And I take a screenshot named "dashboard_page1.png"

  Scenario: Partner goto New Order Page and navigate back to dashboard
    Given I navigate from the dashboard to the "new order business details" page
    Then I should see the text of "Order SIP" in the "//h1" segment
    And I take a screenshot named "new_order.png"
    And I take a screenshot named "order_sip_page1.png"
    And I click the "vodafone" icon
    And I should see the text of "Welcome, to Vodafone Business Portal" in the "//h1" segment
    And I take a screenshot named "dashboard_page2.png"

  Scenario: Partner goto My Order and navigate back to dashboard
    Given I navigate from the dashboard to the "my orders" page
    And I should see the text of "Orders" in the "//h1" segment
    And I take a screenshot named "my_order.png"
    And I click the "vodafone" icon
    And I should see the text of "Welcome, to Vodafone Business Portal" in the "//h1" segment
    And I take a screenshot named "dashboard_page3.png"

  Scenario: Partner goto My Services and navigate back to dashboard
   Given I navigate from the dashboard to the "my services" page
   And I should see the text of "Services" in the "//h1" segment
   And I take a screenshot named "my_services.png"
   And I click the "vodafone" icon
   And I should see the text of "Welcome, to Vodafone Business Portal" in the "//h1" segment
   And I take a screenshot named "dashboard_page4.png"

  Scenario: Partner goto SIP Info and navigate back to dashboard
    Given I navigate from the dashboard to the "sip trunk page" page
    And I should see the text of "SIP trunking" in the "//h2" segment
    And I take a screenshot named "sip_info.png"
    And I click the "vodafone" icon
    And I should see the text of "Welcome, to Vodafone Business Portal" in the "//h1" segment
    And I take a screenshot named "dashboard_page5.png"

  Scenario: Partner goto Help/FAQ and navigate back to dashboard
    Given I navigate from the dashboard to the "help page" page
    And I should see the text of "Help" in the "//h3" segment
    And I take a screenshot named "help_info.png"
    And I click the "vodafone" icon
    And I should see the text of "Welcome, to Vodafone Business Portal" in the "//h1" segment
    And I take a screenshot named "dashboard_page6.png"

