*** Settings ***
Documentation     Windows page test cases
Test Setup        Open herokuapp application windows page
Test Teardown     Close the Browser
Resource          windows.keywords.robot
Resource          windows.page.robot
Resource          ../../variables.robot
Resource          ../common.keywords.robot

*** Test Cases ***
Verify new window is opened when user click on link 'Click Here'
    [Tags]    Windows
    Verify user is on "Opening a new window"
    Click on "Click Here" link
    Verify that new window opens