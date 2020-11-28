*** Settings ***
Resource          login.page.robot

*** Keywords ***
Verify User is able to login the application and Log Out
    Verify that user is on Secure Area page
    Click on Log out button
