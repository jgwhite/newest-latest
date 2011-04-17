Feature: discover_projects
  In order to track Poke's Projects
  I want to trawl their Twitter feed for launch announcements

  Scenario: running discover_projects
    Given a Maker with the following attributes:
      | key   | value                         |
      | name  | Poke                          |
      | feeds | http://twitter.com/pokelondon |
    When I run "discover_projects"
    Then it should return the following Projects:
      | url                          | name                                   |
      | http://thefeed.orange.co.uk/ | The Feed                               |
      | http://bit.ly/gYYoWH         | I’m looking for the new me. Is it you? |
      | http://www.pokelondon.com/   | POKE                                   |
      | http://bit.ly/ha7w8c         | The Feed                               |
      | http://instaprint.me/        | Instaprint                             |
      | http://www.lovieawards.eu/   | Lovie Awards                           |
