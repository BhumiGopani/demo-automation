*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Xpath_new_window_text}      //*[text()[contains(.,'Opening a new window')]]
${Xpath_click_here_link}      //*[@href="/windows/new"]
${Xpath_new_window_text}      //*[text()[contains(.,'New Window')]]

*** Keywords ***
Open herokuapp application windows page
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
    ${login_url} =  Catenate    SEPARATOR=  ${url}   windows
    Open Browser    ${login_url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${Xpath_Login_logo}

Verify user is on "Opening a new window"
    Page Should Contain Element     ${Xpath_new_window_text} 

Click on "Click Here" link
    Click Link  ${Xpath_click_here_link}
    Switch Window

Verify that new window opens
    Page Should Contain Element     ${Xpath_new_window_text} 