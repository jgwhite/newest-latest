Feature: profile
  In order to get a full picture of a project
  I want to read details from its homepage

  Scenario: running profile
    Given a Project with the following attributes:
      | key | value                       |
      | url | http://www.cutlasercut.com/ |
    When I run "profile!"
    Then it should have the following attributes:
      | key  | value         |
      | name | Cut laser cut |
