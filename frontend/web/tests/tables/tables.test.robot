*** Settings ***
Documentation     Tables page test cases
Test Setup        Open herokuapp application tables page
Test Teardown     Close the Browser
Resource          tables.keywords.robot
Resource          tables.page.robot
Resource          ../../variables.robot
Resource          ../common.keywords.robot

*** Test Cases ***
Verify user is able to sort 'Last Name' of Emaple table 1
    [Tags]    Tables
    Verify that Example table 1 is displayed
    Click on 'Last Name' Column
    Verify that last name is sorted in ascending order 
    Click on 'Last Name' Column
    Verify that last name is sorted in descending order 

Verify user is able to sort 'First Name' of Emaple table 2
    [Tags]    Tables
    Verify that Example table 2 is displayed
    Click on 'First Name' Column
    Verify that First name is sorted in ascending order 
    Click on 'First Name' Column
    Verify that First name is sorted in descending order 

