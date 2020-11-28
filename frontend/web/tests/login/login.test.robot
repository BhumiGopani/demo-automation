*** Settings ***
Documentation     Login page test cases
Test Setup        Open herokuapp application for login page
Test Teardown     Close the Browser
Resource          login.keywords.robot
Resource          login.page.robot
Resource          ../../variables.robot
Resource          ../common.keywords.robot

*** Test Cases ***
User with valid credentials must be able to Login the application
    [Tags]    Login
    Input user data    ${admin}    ${admin_password}
    Click on Login Button
    Verify User is able to login the application and Log Out

User with invalid credentials should not be able to Login the application
    [Tags]    Login
    Input user data    Invalid_user    Invalid_pass
    Click on Login Button
    Verify Error message for unauthorized User

User with invalid password should not be able to Login the application
    [Tags]    Login
    Input user data    ${admin}    Invalid_pass
    Click on Login Button
    Verify Error message for invalid password

User with invalid - blank password should not be able to Login the application
    [Tags]    Login
    Input user data    ${admin}    ''
    Click on Login Button
    Verify Error message for invalid password

User with invalid - space password should not be able to Login the application
    [Tags]    Login
    Input user data    ${admin}    ' '
    Click on Login Button
    Verify Error message for invalid password
