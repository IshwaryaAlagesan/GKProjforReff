@ECS-455
Feature: ECS-455 -- My Orders Page
  In order for to keep track of orders that I have placed with Vodafone
  As a partner
  I need to be able to see my existing orders and their statuses

  Rules:
    1.  All orders should be displayed in a paginated table
    2.  By default the orders should be sorted by the "Updated" date desc
    3.  The search bar at the top should search (case insensitive) through the partner's orders using the:
    3a. - order ID
    3b. - company name
    4.  There should be a button to create a new order
    5.  There should be a link to the My Services page


  Background:
    Given I log in as a partner
    Then I should be on the "dashboard" page
    And I navigate from the dashboard to the "my orders" page


#  @1
  Scenario: All orders should be displayed in a paginated table
    Then I should see the "orders" table
    And the "orders" table should have 10 visible rows
    And the "orders" table should have a total of 13 rows
    And I take a screenshot named "my_orders_page_pagination.png"

#  @2
  Scenario: By default the orders should be sorted by the "Updated" date desc
    Then the "orders" table should be ordered by the "Updated" column descending
    When I click the "orders" table "Updated" column header
    And I wait for 0.5 seconds
    Then the "orders" table should be ordered by the "Updated" column ascending
    And I take a screenshot named "my_orders_page_after_sorting.png"

#  @3a
  Scenario: Search for an order by ID
    When I fill in the "order search" input with the text "451"
    Then the "orders" table should have 1 visible row
    And the "orders" table should contain the text "2343451"
    And I take a screenshot named "my_orders_page_sort_ID.png"

#  @3b
  Scenario: Search for an order by company name
    When I fill in the "order search" input with the text "NAME 3"
    Then the "orders" table should have 4 visible rows
    And the "orders" table should contain the text "2343451"
    And the "orders" table should contain the text "2343407"
    And the "orders" table should contain the text "2343411"
    And the "orders" table should contain the text "2343465"
    And I take a screenshot named "my_orders_page_sort_company.png"

#  @4
  Scenario: There should be a button to create a new order
    When I click the "Create new order" button
    Then I should be on the "new order business details" page
    And I take a screenshot named "create_new_order.png"

#  @5
  Scenario: There should be a link to the My Services page
#    When I click the "Search Orders" link
#    Then I should be on the "My services" page
    Then I should see the text "Search Orders"
    And I take a screenshot named "my_services_page_from_my_orders.png"
