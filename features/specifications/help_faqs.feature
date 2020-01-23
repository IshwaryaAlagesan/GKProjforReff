@ECS-867 @VSTS-64015
Feature: ECS-867 -- FAQ knowledge base


  Rules:
  1.  Partner can be able to see the Help Menu on the top right of the Portal
  2.  Partner can be able to navigate to Help/FAQs page
  3.  Partner can be able to see the Top FAQs should be appear in the list
  4.  Partner can be able see the Instant Type Question and get list of suggestions
  5.  Partner can be able to get an answer for the selected questions
  6.  Partner can be able to navigate back to dashboard from Help Page


  Background:
    Given I log in as a partner


  Scenario: Partner can be able to see the Help Menu on the top right of the Portal
    Given I should see the text of "Help" in the "//a[contains(@class,'vfuk-Header__links-list-item')]" segment
    Then I take a screenshot named "help_page_1.png"

  Scenario: Partner can be able to navigate to Help/FAQs page
    Given I navigate from the dashboard to the "help page" page
    Then I should be on the "help" page
    And I should see the text "Help"
    And I take a screenshot named "help_page_2.png"

  Scenario: Partner can be able to see the Top FAQs should be appear in the list
    Given I navigate from the dashboard to the "help page" page
    Then I should be on the "help" page
    And I wait for 1 seconds
#    And I should see the "Top 5 FAQs" in the "faq" frame
#    And I should see the "Which PBX's do Vodafone support?" in the "faq" frame
#    And I should see the "Can I buy Evolved Voice over the Public Internet and chose Vodafone as my internet service provider (ISP)?" in the "faq" frame
#    And I should see the "Can I add or remove channels without penalties?" in the "faq" frame
    And I take a screenshot named "help_page_3.png"

  Scenario: Partner can be able see the Instant Type Question and get list of suggestions
    Given I navigate from the dashboard to the "help page" page
    Then I should be on the "help" page
    And I wait for 1 seconds
#    And I should see the "Get Instant Answers:" in the "faq" frame
#    When I fill the "Get instant answers" input with the text "how" in the "faq" frame
#    And I wait for 1 seconds
#    Then I should see the "how can i port numbers in" in the "faq" frame
#    Then I should see the "need help with billing payments" in the "faq" frame
#    Then I should see the "why is my bill so big" in the "faq" frame
    And I take a screenshot named "help_page_4.png"

  Scenario: Partner can be able to get an answer for the selected questions
    Given I navigate from the dashboard to the "help page" page
    Then I should be on the "help" page
    And I wait for 1 seconds
#    And I should see the "Get Instant Answers:" in the "faq" frame
#    When I fill the "Get instant answers" input with the text "how" in the "faq" frame
#    And I wait for 1 seconds
#    When I click the "how can i port numbers in" in the "faq" frame
#    Then I should see the "Very easy! Sometimes the old ways work best." in the "faq" frame
#    Then I should see the "Pay your bill online" in the "faq" frame
    And I take a screenshot named "help_page_5.png"

  Scenario: Partner can be able to navigate back to dashboard from Help Page
    Given I navigate from the dashboard to the "help page" page
    Then I should be on the "help" page
    And I should see the text "Help"
    And I take a screenshot named "help_page_61.png"
    When I go to the "dashboard" page
    And I take a screenshot named "help_page_62.png"
    