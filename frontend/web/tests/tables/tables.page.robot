*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Xpath_table1}                     //*[@id="table1"]
${Xpath_table2}                     //*[@id="table2"]
${Xpath_table1_lastname}            //*[@id="table1"]//th[1]
${Xpath_table1_lastname_asc}        //*[@class="header headerSortDown"]
${Xpath_table1_lastname_dsc}        //*[@class="header headerSortUp"]
${Xpath_table2_firstname}           //*[@id="table2"]//th[2]
${Xpath_table2_firstname_asc}       //*[@class="header headerSortDown"]
${Xpath_table2_firstname_dsc}       //*[@class="header headerSortUp"]

*** Keywords ***
Open herokuapp application tables page
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
    ${login_url} =  Catenate    SEPARATOR=  ${url}   tables
    Open Browser    ${login_url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${Xpath_Login_logo}

Verify that Example table 1 is displayed
    Element Should Be Visible   ${Xpath_table1} 

Click on 'Last Name' Column
    Click Element   ${Xpath_table1_lastname} 

Verify that last name is sorted in ascending order 
    Wait Until Element Is Visible   ${Xpath_table1_lastname_asc} 

Verify that last name is sorted in descending order 
    Wait Until Element Is Visible   ${Xpath_table1_lastname_dsc} 

Verify that Example table 2 is displayed
    Element Should Be Visible   ${Xpath_table2} 
    
Click on 'First Name' Column
    Click Element   ${Xpath_table2_firstname}

Verify that First name is sorted in ascending order
    Wait Until Element Is Visible   ${Xpath_table2_firstname_asc}

Verify that First name is sorted in descending order 
    Wait Until Element Is Visible   ${Xpath_table2_firstname_dsc}  
