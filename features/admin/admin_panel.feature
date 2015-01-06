Feature: Admin header and sidebar function
  In order to get right client effect in admin area
  A admin user
  Should be able to use items effect in header and sidebar

  Scenario Outline: Change left sidebar size to medium/small/none
    Given I'm logged in as admin user
    Given Sidebar is on <state> 
    When I click to <button>
    Then I should find <display> sidebar class
    And I should find <display1> top mega list class

  Examples:
    |  state     |  button                |  display   |  display1   |
    |  "normal"  |  ".nav-small-button"   |  ".small"  |  ".hidden"  |
    |  "normal"  |  ".nav-medium-button"  |  ".medium" |  ".hidden"  |
    |  "small"   |  ".nav-small-button"   |  ".normal" |  ""         |
    |  "small"   |  ".nav-medium-button"  |  ".medium" |  ".hidden"  |
    |  "medium"  |  ".nav-small-button"   |  ".small"  |  ".hidden"  |
    |  "medium"  |  ".nav-medium-button"  |  ".normal" |  ""         |

  Scenario Outline: Show/hide left sidebar and header 
    Given I'm logged in as admin user
    Given Collapse items: <state>
    When I click to <button> button
    Then I should see <display> sidebar class
    And I should see <display1> header class

  Examples: 
    |  state         |  button                    |  display               |  display1             |
    |  "none"        |  ".remove-sidebar-button"  |  ".collapsed-sidebar"  |  ""                   |
    |  "none"        |  ".remove-header-button"   |  ""                    |  ".collapsed-header"  |
    |  "none"        |  ".fullscreen-button"      |  ".collapsed-sidebar"  |  ".collapsed-header"  |
    |  "sidebar"     |  ".remove-sidebar-button"  |  ""                    |  ""                   |
    |  "sidebar"     |  ".remove-header-button"   |  ""                    |  ".collapsed-header"  |
    |  "sidebar"     |  ".fullscreen-button"      |  ".collapsed-sidebar"  |  ".collapsed-header"  |
    |  "header"      |  ".remove-sidebar-button"  |  ".collapsed-sidebar"  |  ""                   |
    |  "header"      |  ".remove-header-button"   |  ""                    |  ""                   |
    |  "header"      |  ".fullscreen-button"      |  ".collapsed-sidebar"  |  ".collapsed-header"  |
    |  "fullscreen"  |  ".remove-sidebar-button"  |  ".collapsed-sidebar"   |  ""                   |
    |  "fullscreen"  |  ".remove-header-button"   |  ""                    |  ".collapsed-header"  |
    |  "fullscreen"  |  ".fullscreen-button"      |  ""                    |  ""                   |

  @dev
  Scenario Outline: Main heading of page
    Given I'm logged in as admin user
    When I go to <page>
    Then I should see <heading>

  Examples: 
  |  page                |  heading            |
  |  "!rooms-list"       |  "Rooms list"       |
  |  "!room-type-list"   |  "Room Type list"   |
  |  "!amenities-list"   |  "Amenities list"   |
      
