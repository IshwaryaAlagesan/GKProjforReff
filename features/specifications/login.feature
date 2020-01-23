@all @Login
Feature: Login Feature - Partner login page
  In order to access orders and services online
  As a partner
  I need to be able to login to my account

  Rules:
  1.  We need to be able to login and use the dashboard
  2. Need to check the invalid login scenarios of all combination. None should pass login.

#  @sauce
#  Scenario: Check Sauce Labs
#    When I go to the url "http://localhost:8080/#/login"
#    Then I should see the text "Login"
#    When I fill in the "username" input with the text "test@vodafone.com"
#    And I fill in the "password" input with the text "Password123!"
#    And I click the "Continue" button
#    And I wait for 1 second
#    Then I should see the text "Welcome"

#  @1
  Scenario: Log in to SIP Portal using Valid username and password
    Given I go to the "login" page
    When I should see the text "Sign in with your email and password"
#    And I wait for page to load
    And I fill in the "/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/div[1]/input" input with the text "test@vodafone.com"
    And I fill in the "/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/div[2]/input" input with the text "Password123!"
    And I take a screenshot named "login_page.png"
    And I click the "/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/input[3]" button
    And I wait for 1 second
    Then I should be on the "home" page
    And I take a screenshot named "dashboard_page.png"
    When I click the element "#createNewOrder"
    Then I should be on the "new order business details" page

#  @2 @Invalid_Login
  Scenario Outline: User try to login to SIP Portal using invalid username or password
    Given I go to the "login" page
    When I should see the text "Sign in with your email and password"
    And I fill in the "/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/div[1]/input" input with the text "<usrname>"
    And I fill in the "/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/div[2]/input" input with the text "<password>"
    And I click the "/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/input[3]" button
    And I wait for 1 second
    Then I should see the text "<output>"
    And I take a screenshot named "login_page_Invalid_Cred_<Scene>.png"
#    And I save a screenshot on "/Login" with name "login_page_Invalid_Cred_<Scene>.png"
    Examples:
      | usrname         | password  | output                            |Scene    |
      | blabla          | blabla    |The username or password you entered is invalid|1        |
      |test@vodafone.com| blabla    |The username or password you entered is invalid|2        |
      |                 |           |Sign in with your email and password         |3        |
      |test@vodafone.com|           |Sign in with your email and password|4        |

#  @2 @Invalid_OneTest
#  Scenario: User try to login to SIP Portal using invalid username or password {"usrname":"blabla","password":"blabla","output":"User does not exist.","Scene":"1"}
#    Given I ensure I am logged out
#    When I go to the "login" page
#    And I fill in the "username" input with the text "dummy"
#    And I fill in the "password" input with the text "*****"
#    And I click the "Continue" button
#    And I wait for 1 second
#    Then I should see the text "The username or password you entered is invalid"
#    And I take a screenshot named "login_page_Invalid_Cred.png"
##    And I take a screenshot named "login_page_Invalid_Cred_1.png"
    # And I save a screenshot on "/Login" with name "login_page_Invalid_Cred_2.png"
#
#  @3 @WebsiteFooter
#  Scenario: User login to SIP Portal and validate Footer description
#    Given I ensure I am logged out
#    When I go to the "login" page
#    And I fill in the "username" input with the text "test@vodafone.com"
#    And I fill in the "password" input with the text "Password123!"
#    And I click the "Continue" button
#    And I wait for 1 second
#    Then I should be on the "dashboard" page
#    And I should see the text of "© 2018 Vodafone Limited. Registered office: Vodafone House, The Connection, Newbury, Berkshire RG14 2FN. Registered in England No 1471587." in the "//p[@class='vfuk-PageFooter__copyright']" segment
#    And I should see the text of "Privacy Policy" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Privacy Policy')]" segment
#    And I should see the text of "Terms & conditions" in the "//footer[@class='vfuk-PageFooter__footer']//a[contains(text(),'Terms & conditions')]" segment
#    # And I save a screenshot on "/Website_Footer" with name "Website_Footer.png"

  Scenario: User try to login to SIP Portal using invalid username or password {"usrname":"blabla","password":"blabla","output":"User does not exist.","Scene":"1"}
    Given I go to the "login" page
    When I should see the text "Sign in with your email and password"
#    And I wait for page to load
    And I fill in the "/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/div[1]/input" input with the text "test"vodafone.com"
    And I fill in the "/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/div[2]/input" input with the text "blabla"
    And I take a screenshot named "login_page.png"
    And I click the "/html/body/div[1]/div/div[2]/div[2]/div[2]/div[2]/div/div/form/input[3]" button
    And I wait for 1 second
    Then I should see the text "The username or password you entered is invalid"
    And I take a screenshot named "login_page_Invalid_Cred_<Scene>.png"