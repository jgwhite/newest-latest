Feature: discover_projects
  In order to discover projects
  As a curator
  I want to trawl a Maker's feed for launch annoncements and links

  Scenario: Discovering Poke's projects from their Twitter feed
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

  Scenario: Discovering With Associates' projects from their Twitter feed
    Given a Maker with the following attributes:
      | key   | value                             |
      | name  | With Associates                   |
      | feeds | http://twitter.com/withassociates |
    When I run "discover_projects"
    Then it should return the following Projects:
      | url                                  | name                  |
      | http://bbc.in/eak1TI                 | BBC Music Introducing |
      | http://2011.withassociates.com/april | With Associates       |
