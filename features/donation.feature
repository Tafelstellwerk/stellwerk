Feature: Donations
  As a donor
  I want to create, edit, delete donations
  So that they are availible on the platform

  Background:
    Given I have signed up on the platform as a donor

  Scenario: Opening the new donation page
    When I go to the homepage
    And I click on the new donation button
    Then I should be on the new donation page

  Scenario: Creating a donation
    Given I'm on the new donation page
    When I fill in the donation data and click on the create button
    Then I should see my new donation
    And I should see a confirmation message
