*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Xpath_Dynamic_Control_textfeild}          //*[@id="input-example"]//*[@type="text"]
${Xpath_Dynamic_Control_enable_button}      //*[@type="button" and text()[contains(.,'Enable')]]
${Xpath_Dynamic_Control_disable_button}     //*[@type="button" and text()[contains(.,'Disable')]]

*** Keywords ***
Open herokuapp application for dynamic-controls page
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
    ${exit_intent_url} =  Catenate    SEPARATOR=  ${url}   dynamic_controls
    Open Browser    ${exit_intent_url}    ${browser}
    Maximize Browser Window

Verify the default status of text field
    Element Should Be Disabled  ${Xpath_Dynamic_Control_textfeild}

Click on 'Enable' button
    Click Button    ${Xpath_Dynamic_Control_enable_button}

Verify that field is enabled to edit after async waiting link
    Wait Until Element Is Not Visible   ${Xpath_Dynamic_Control_enable_button}    timeout=60

Enter data in the text field
    Element Text Should Be   //*[@id="message"]  It's enabled!
    Input Text  ${Xpath_Dynamic_Control_textfeild}  Test@1234

Click on 'Disable' button
    Click Button    ${Xpath_Dynamic_Control_disable_button}

Verify the field is disabled to edit after async waiting link
    Wait Until Element Is Not Visible   ${Xpath_Dynamic_Control_disable_button}   timeout=60