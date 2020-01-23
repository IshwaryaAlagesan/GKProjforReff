@all @my_services
Feature: Partner existing service information
  In order for to keep track of services that I have with Vodafone
  As a partner
  I need to be able to see my existing services and their statuses

  Rules:
    1.  All services should be displayed in paginated tables, group by status
    1a. - Pending Services
    1b. - Active Services
    1c. - Ceased Services
    2.  By default the services should be sorted by the "Updated" date desc in each table
    3.  The search bar at the top should search (case insensitive) through the partner's services in each table using the:
    3a. - order ID
    3b. - company name
    4.  There should be a link to create a new order
    5.  There should be a link to the My Orders page


  Background:
    Given I log in as a partner
    And I navigate from the dashboard to the "my services" page


  @1a @1b @1c
  Scenario Outline: All services should be displayed in paginated tables, group by status
    Then I should see the "<status>" table
    And the "<status>" table should have <visible rows> visible rows
    And the "<status>" table should have a total of <total rows> rows

    Examples:

      | status           | visible rows | total rows |
      | Pending Services | 2            | 2          |
      | Active Services  | 10           | 12         |
      | Ceased Services  | 1            | 1          |

  @2
  Scenario: By default the orders should be sorted by the "Updated" date desc
    Then the "Pending Services" table should be ordered by the "Last updated" column descending
    And the "Active Services" table should be ordered by the "Last updated" column descending
    And the "Ceased Services" table should be ordered by the "Last updated" column descending

  @3a
  Scenario: Search for a service by ID
    When I fill in the "service search" input with the text "11"
    Then the "Pending Services" table should contain the text "Sorry, no matching records found"
    And the "Active Services" table should have 1 visible row
    And the "Active Services" table should contain the text "2343411"
    And the "Ceased Services" table should contain the text "Sorry, no matching records found"

  @3b
  Scenario: Search for a service by company name
    When I fill in the "service search" input with the text "NAME 2"
    And I wait for 0.5 seconds
    Then the "Pending Services" table should have 1 visible row
    And the "Pending Services" table should contain the text "2343454"
    And the "Active Services" table should have 4 visible rows
    And the "Active Services" table should contain the text "2343435"
    And the "Active Services" table should contain the text "2343436"
    And the "Active Services" table should contain the text "2343437"
    And the "Active Services" table should contain the text "2343467"
    And the "Ceased Services" table should have 1 visible row
    And the "Ceased Services" table should contain the text "2343487"

  @4
  Scenario: There should be a link to create a new order
    When I click the "Create new order" link in the "content" section
    Then I should be on the "new order business details" page
    And I take a screenshot named "PBX_page_from_my_services.png"

  @5
  Scenario: There should be a link to the My Services page
    When I click the "Search for an order" link
    Then I should be on the "My orders" page
    And I take a screenshot named "my_orders_page_from_my_services.png"
