Feature: Building a Curriculum
  In order to facilitate online learning
  As a contributor
  I want to build a curriculum

  Scenario: Viewing the curricula index
    Given there are some root and non-root curricula
    When I am on the curricula index
    Then I should see only root-level curricula

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

  Scenario: Creating a sub-curriculum
    Given a curriculum exists
    When I am on the curriculum's page
    And I create a new sub-curriculum
    Then I should see the sub-curriculum

  Scenario: Editing  a curriculum
    Given a curriculum exists
    When I am on the curriculum's page
    And I click the edit link
    Then I should see a form
