@main_screen
Feature: As a user i want to convert units
	
	Scenario: When i tap on menu icon, i should see left side menu
		Given I land on home screen
		When I press on the menu Icon
		Then I should see left side menu
		
	Scenario: I shoudld be able to see my conversation screen
		Given I land on home screen
		When I press on the menu Icon
		And I press on my conversation button
		Then I land on My Conversation Screen