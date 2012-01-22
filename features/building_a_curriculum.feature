Feature: Building a Curriculum
  In order to facilitate online learning
  As a contributor
  I want to build a curriculum

  Scenario: Seeing the new curriculum page
    When I am on the new curriculum page
    Then I should see a form

  Scenario: Creating a new curriculum
    When I am on the new curriculum page
    And I submit a curriculum
    Then I should see the curriculum

  Scenario: Viewing a curriculum
    Given a curriculum exists
    When I am on the curriculum's page
    Then I should see the curriculum
    And I should see a link to create a sub-curriculum
