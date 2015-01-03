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

  @dev
  Scenario Outline: Show/hide left sidebar and header 
    Given I'm logged in as admin user
    Given Sidebar is <state>
    Given Header is <state1>
    When I click to <button> button
    Then I should see <display> sidebar class
    And I should see <display1> header class

  Examples: 
    |  state                |  state1              |  button                    |  display               |  display1             |
    |  ""                   |  ""                  |  ".remove-sidebar-button"  |  ".collapsed-sidebar"  |  ""                   |
    |  ""                   |  ""                  |  ".remove-header-button"   |  ""                    |  ".collapsed-header"  |
    |  ""                   |  ""                  |  ".fullscreen-button"      |  ".collapsed-sidebar"  |  ".collapsed-header"  |
    |  "collapsed-sidebar"  |  ""                  |  ".remove-sidebar-button"  |  ""                    |  ""                   |
    |  "collapsed-sidebar"  |  ""                  |  ".remove-header-button"   |  ".collapsed-sidebar"  |  ".collapsed-header"  |
    |  "collapsed-sidebar"  |  ""                  |  ".fullscreen-button"      |  ".collapsed-sidebar"  |  ".collapsed-header"  |
    |  ""                   |  "collapsed-header"  |  ".remove-sidebar-button"  |  ".collapsed-sidebar"  |  ".collapsed-header"  |
    |  ""                   |  "collapsed-header"  |  ".remove-header-button"   |  ""                    |  ""                   |
    |  ""                   |  "collapsed-header"  |  ".fullscreen-button"      |  ".collapsed-sidebar"  |  ".collapsed-header"  |
    |  "collapsed-sidebar"  |  "collapsed-header"  |  ".remove-sidebar-button"  |  ""                    |  ".collapsed-header"  |
    |  "collapsed-sidebar"  |  "collapsed-header"  |  ".remove-header-button"   |  ".collapsed-sidebar"  |  ""                   |
    |  "collapsed-sidebar"  |  "collapsed-header"  |  ".fullscreen-button"      |  ""                    |  ""                   |
