Feature: Using worm

  Background:
    Given I launch the app

  Scenario:  Finding accessible labels
    Given I am on the "Worm Page"
    Then I can see that the label "worm" displays the text "Worm"
