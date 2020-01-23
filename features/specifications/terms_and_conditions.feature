@ECS-2796 @VSTS-64026
Feature: ECS-2796 -- Portal Terms and Conditions


  Rules:
  1.  Partner can be able to see the Terms of Service link in the page footer
  2.  Partner can be able to navigate to Terms and Conditions Page
  3.  Partner can be able to Terms and Conditions link appears in the Create new order page
  4.  Partner can be able to see Terms and Conditions content in the Terms of Service Page
  5.  Partner can be able to navigate back to Dashboard page from Terms of Service Page

  Background:
    Given I log in as a partner

  Scenario: Partner can be able to see the Terms of Service link in the page footer
    Given I should see the text of "Terms of Service" in the "//footer[@class='vfuk-PageFooter__footer']" segment
    Then I take a screenshot named "terms_page_1.png"

  Scenario: Partner can be able to navigate to Terms and Conditions Page
    Given I navigate from the dashboard to the "terms of service page" page
    Then I should be on the "terms of service page" page
    And I should see the text "Terms of Use - Vodafone Business Portal"
    And I take a screenshot named "terms_page_2.png"

  Scenario: Partner can be able to Terms and Conditions link appears in the Create new order page
    Given I navigate from the dashboard to the "new order business details" page
    Then I should be on the "new order business details" page
    And I should see the text of "Terms of Service" in the "//footer[@class='vfuk-PageFooter__footer']" segment
    And I take a screenshot named "terms_page_3.png"

  Scenario: Partner can be able to see Terms and Conditions content in the Terms of Service Page
    Given I navigate from the dashboard to the "terms of service page" page
    Then I should be on the "terms of service page" page
    And I should see the text "Terms of Use - Vodafone Business Portal"
    And I should see the text "YOUR USE OF THIS SITE CONSTITUTES YOUR AGREEMENT TO BE BOUND BY THESE TERMS."
    And I should see the text "Limited License."
    And I should see the text "All copyright, trade marks, patents and other intellectual property rights in any material or conten"
    And I should see the text "(a) any information which has been published other than through a breach of the Terms;"
    And I should see the text "interpreted in accordance with English law and you and we both consent to the non-exclusive jurisdiction of the English courts."
    And I take a screenshot named "terms_page_4.png"

  Scenario: Partner can be able to navigate back to Dashboard page from Terms of Service Page
    Given I navigate from the dashboard to the "terms of service page" page
    Then I should be on the "terms of service page" page
    When I click the element "//span[@class='SVGInline']"
    And I wait for 2 seconds
    Then I should see the text "Welcome"
    And I should see the text "Vodafone Business Portal"
    And I take a screenshot named "terms_page_5.png"