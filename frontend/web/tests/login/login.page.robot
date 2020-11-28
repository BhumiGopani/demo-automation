*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Xpath_Login_logo}                         //*[@class="example"]
${Xpath_Login_username_textfeild}           //*[@id="username"]
${Xpath_Login_password_textfeild}           //*[@id="password"]
${Xpath_Login_submit_button}                //button[@type="submit"]
${Xpath_Flash_message}                      //div[@id="flash-messages"]
${Xpath_SecureArea_logout_button}           //*[@href="/logout"]
${Xpath_Login_submit_button_error_message}  //*[@id="flash" and @class="flash error"]

*** Keywords ***
Open herokuapp application for login page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    disable-infobars
    Call Method    ${chrome_options}    add_argument    start-maximized
    Call Method    ${chrome_options}    add_argument    enable-automation
    Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    Call Method    ${chrome_options}    add_argument    --dns-prefetch-disable
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    ${login_url} =  Catenate    SEPARATOR=  ${url}   login
    Open Browser    ${login_url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${Xpath_Login_logo}

Input user data
    [Arguments]    ${user_data}    ${pass_data}
    Input Text    ${Xpath_Login_username_textfeild}    ${user_data}
    Input Text    ${Xpath_Login_password_textfeild}    ${pass_data}

Click on Login Button
    Click Button    ${Xpath_Login_submit_button}

Verify that user is on Secure Area page
    Wait Until Element Is Visible   ${Xpath_Flash_message}

Click on Log out button
    Click Link    ${Xpath_SecureArea_logout_button}

Verify Error message for unauthorized User
    Wait Until Element Is Visible    ${Xpath_Login_submit_button_error_message}
    Element Should Contain    ${Xpath_Login_submit_button_error_message}     Your username is invalid!

Verify Error message for invalid password
    Wait Until Element Is Visible    ${Xpath_Login_submit_button_error_message}
    Element Should Contain    ${Xpath_Login_submit_button_error_message}    Your password is invalid!