@ECS-891 @VSTS-64027
Feature: ECS-891 -- SIP Portal Website Footer Page validation


  Rules:
  1.  Log in as Partner and validate the Footer Page content at Dashboard Page.
  2.  Log in as Partner and validate the Footer Page content at New Business Page


  Background:
    Given I log in as a partner

#  @1 @websitefooter
  Scenario: Validate Footer description at Dashboard Page
    Then I should be on the "dashboard" page
    And I should see the text of "© 2019 Vodafone Limited. Registered office: Vodafone House, The Connection, Newbury, Berkshire RG14 2FN. Registered in England No 1471587." in the "//p[@class='vfuk-PageFooter__copyright']" segment
    And I should see the text of "Privacy Policy" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Privacy Policy')]" segment
    And I should see the text of "Terms & Conditions" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Terms & Conditions')]" segment
    And I take a screenshot named "Website_Footer.png"
    # And I save a screenshot on "/Website_Footer" with name "Website_Footer.png"


#  @2 @websitefooter
  Scenario: Validate Footer description at New Order BusinessPage
    Given I navigate from the dashboard to the "new order business details" page
    Then I should not see the "Save and continue" button
    And I should not see the "address" dropdown list
    And I should see the text of "© 2019 Vodafone Limited. Registered office: Vodafone House, The Connection, Newbury, Berkshire RG14 2FN. Registered in England No 1471587." in the "//p[@class='vfuk-PageFooter__copyright']" segment
    And I should see the text of "Privacy Policy" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Privacy Policy')]" segment
    And I should see the text of "Terms & Conditions" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Terms & Conditions')]" segment
    And I take a screenshot named "Website_Footer.png"

#  @3 @websitefooter
  Scenario: Validate Footer description at New Order Service Details Page
    Given I navigate from the dashboard to the "new order service details" page
    Then I should see the text of "© 2019 Vodafone Limited. Registered office: Vodafone House, The Connection, Newbury, Berkshire RG14 2FN. Registered in England No 1471587." in the "//p[@class='vfuk-PageFooter__copyright']" segment
    And I should see the text of "Privacy Policy" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Privacy Policy')]" segment
    And I should see the text of "Terms & Conditions" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Terms & Conditions')]" segment
    And I take a screenshot named "Website_Footer.png"

#  @4 @websitefooter
  Scenario: Validate Footer description at My Orders Page
    When I navigate from the dashboard to the "my orders" page
    Then I should see the text of "© 2019 Vodafone Limited. Registered office: Vodafone House, The Connection, Newbury, Berkshire RG14 2FN. Registered in England No 1471587." in the "//p[@class='vfuk-PageFooter__copyright']" segment
    And I should see the text of "Privacy Policy" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Privacy Policy')]" segment
    And I should see the text of "Terms & Conditions" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Terms & Conditions')]" segment
    And I take a screenshot named "Website_Footer.png"

#  @5 @websitefooter
  Scenario: Validate Footer description at My Services  Page
    When I navigate from the dashboard to the "my services" page
    Then I should see the text of "© 2019 Vodafone Limited. Registered office: Vodafone House, The Connection, Newbury, Berkshire RG14 2FN. Registered in England No 1471587." in the "//p[@class='vfuk-PageFooter__copyright']" segment
    And I should see the text of "Privacy Policy" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Privacy Policy')]" segment
    And I should see the text of "Terms & Conditions" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Terms & Conditions')]" segment
    And I take a screenshot named "Website_Footer.png"

  Scenario: Validate Footer description at Help  Page
    When I navigate from the dashboard to the "help page" page
    Then I should see the text of "© 2019 Vodafone Limited. Registered office: Vodafone House, The Connection, Newbury, Berkshire RG14 2FN. Registered in England No 1471587." in the "//p[@class='vfuk-PageFooter__copyright']" segment
    And I should see the text of "Privacy Policy" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Privacy Policy')]" segment
    And I should see the text of "Terms & Conditions" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Terms & Conditions')]" segment
    And I take a screenshot named "Website_Footer.png"