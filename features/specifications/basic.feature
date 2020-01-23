# @ECS-455
Feature: ECS-455 My-Orders
  # Partner should be able to see the My Orders Summary/List and can view individual order details.

  Background:
    Given I am logged in as a Partner

  Scenario: The partner can view My Orders Summary Page
    Given I navigate from the dashboard to the "my orders" page
    Then I should see the "Orders" text

  Scenario: The partner can view My Orders Summary Page2
    Given I navigate from the dashboard to the "my orders" page
    Then I should see the "Orders" text