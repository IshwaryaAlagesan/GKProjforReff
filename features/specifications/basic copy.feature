@ECS-456
Feature: ECS-456 My-Dummy
  Partner should be able to see the My Orders Summary/List and can view individual order details.

  Background:
    Given I am logged in as a Partner

  Scenario: The partner can view My Orders Summary Page
    Given I navigate from the dashboard to the "my orders" page
    Then I should see the "Orders" text