Feature: Building a Curriculum
  In order to facilitate online learning
  As a contributor
  I want to build a curriculum

  Scenario: Seeing the new curriculum page
    When I am on the new curriculum page
    Then I should see a form

  Scenario: Creating a new curriculum
    Given I am on the new curriculum page
    When I submit a curriculum
    Then I should see the curriculum
