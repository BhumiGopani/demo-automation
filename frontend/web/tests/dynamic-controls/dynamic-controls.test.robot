*** Settings ***
Documentation     Dyanamic Controls page test cases
Test Setup        Open herokuapp application for dynamic-controls page
Test Teardown     Close the Browser
Resource          dynamic-controls.keywords.robot
Resource          dynamic-controls.page.robot
Resource          ../../variables.robot
Resource          ../common.keywords.robot

*** Test Cases ***
Verify the functionality of "Enable" and "Disable" button
    [Tags]    dynamic-controls
    Verify the default status of text field
    Click on 'Enable' button
    Verify that field is enabled to edit after async waiting link
    Enter data in the text field
    Click on 'Disable' button
    Verify the field is disabled to edit after async waiting link
