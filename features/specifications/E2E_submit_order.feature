@e2e-trunk
Feature: A partner can place list of trunk only order for E2E Testing

  Background:
    Given I log in as a partner

  Scenario: E2E Test Automation
    Given I log in and place trunk only order in the portal
      | BussinessName    | postcode   | pbxyesorno|pbxmake            |pbxmodel | pbxversion| commitmentperiod | numberofchannels | newnumbers|presentationtype | callbarring1                      |callbarring2         |callbarring3       |
      | SIP Test 1       | OX44XP     | yes       |Avaya              |CS1K     | 7.6       |12 months         | 50               | 20        |CLIP             | no barring                        |                     |                   |
      | SIP Test 2       | OX44XP     | yes       |Avaya              |         |           |                  |                  |           |                  |                                   |                     |                   |
      | SIP Test 3       | OX44XP     | yes       |Avaya              |CS1K     | 7.6       |12 months         | 50               | 10        |CLIR              |international calls                |premium rate services|directory enquiries|
      | SIP Test 4       | OX44XP     | yes       |Avaya              |CS1K     | 7.6       |12 months         | 50               |           |CLIR              |all calls except emergency numbers |                     |                   |
