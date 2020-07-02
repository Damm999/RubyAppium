#Author: tupurnai.kaushik@mindtree.com
#Feature: List of home screen scenarios.
@home
Feature: Test for Home Screen Funtionality
  Verify default and changed values

  Background: 
    Given I land on Home Screen

  Scenario: Default values on Home Scree is Foot and Centimeter
    Then Left Unit Picker value should be Foot
    And Right Unit Picker value should be Centimeter

  Scenario: Verify values selected on Home Scree is changed on requirement
    Then Left Unit Picker value should be "Foot"
    And Right Unit Picker value should be "Centimeter"

  Scenario: Verify show all button is enabled at launch
    Then Show All button should be disabled.
    When I type "1" to target text field.
    Then Show All button should be enabled.
    When I press on clear button
    Then Show All button should be disabled.

  Scenario Outline: Verify default conversion
    When I type "<value>" to target text field.
    Then I should see result as "<result>"
    And I press on clear button

    Examples: 
      | value | result |
      |     6 | 182.88 |
      |     4 | 121.92 |
      |     3 |  91.44 |
      |    22 | 670.56 |

  Scenario: User able to add current conversion to Fav List
    Then I press on Add to Fav Icon
    When I press on Menu Icon
    Then I select "Favorite conversions" tab
    And I verify "Length" added to Fav Conversions List

  Scenario: User is able to search by exisiting Conversion Type
    Then I press on serch icon
    And I type "Temperature" in search feild
    And I press "return" button on my soft keyboard
    Then I see "Temperature" as my current unit converter
    And Left Unit Picker value should be "Celsius"
    And Right Unit Picker value should be "Fahrenheit"

  Scenario Outline: User able to select values from unit pickers
    Then I select "<unitType>" from "<picker>" unit picker
    When I type "<value>" to target text field.
    Then I should see result as "<result>"

    Examples: 
      | picker | unitType         | value | result |
      | right  | Meter            |     1 | 0.3048 |
      | left   | Meter            |     1 |    100 |
      | right  | Link             |     5 | 7.5758 |
      | left   | [Hist.rus.] Span |     2 |  35.56 |
      | left   | [s.rus.] Span    |    22 |    3.2 |

  Scenario: User able to select values from side menu
    When I press on Menu Icon
    Then I select "Volume" from side menu
    Then I select "Bushel" from "right" unit picker
    When I type "22" to target text field.
    Then I should see result as "2.2899"

  Scenario: Verify user able to switch values in unit picker
    Then Left Unit Picker value should be "Foot"
    And Right Unit Picker value should be "Centimeter"
    When I click on swap pickers
    Then Left Unit Picker value should be "Centimeter"
    And Right Unit Picker value should be "Fsoot"

  @wip
  Scenario: User able to cleanup conversion history
    When I press on Menu icon
    Then I select "History" from menu
    Then I see "History" as a current unit converter
    Then I should see text "No history right now"
    When I press on Menu icon
    Then I select "Length" from menu
    When I type "1" on application keyboard
    When I press on Menu icon
    Then I select "History" from menu
    And I verify that 1st result in history list is "Length"
    When I press delete from history at 1st row
    Then I should see text "No history right now"
