*** Settings ***
Documentation     Common Repository for all test cases
Resource          ./login/login.page.robot
Resource          ./tables/tables.page.robot

*** Keywords ***
Close the Browser
    Delete All Cookies
    Close Browser

Reload the page
    Execute Javascript    window.location.reload(true);

    #************************** User Defined Keywords ******************************

Get CSS Property Value
    [Arguments]    ${locator}    ${attribute name}
    [Documentation]    Get the CSS property value of an Element.
    ...
    ...    This keyword retrieves the CSS property value of an element. The element
    ...    is retrieved using the locator.
    ...
    ...    Arguments:
    ...    - locator (string) any Selenium Library supported locator xpath/css/id etc.
    ...    - property_name (string) the name of the css property for which the value is returned.
    ...
    ...    Returns (string) returns the string value of the given css attribute or fails.
    ${css}=    Get WebElement    ${locator}
    ${prop_val}=    Call Method    ${css}    value_of_css_property    ${attribute name}
    [Return]    ${prop_val}
