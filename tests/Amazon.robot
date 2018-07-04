*** Settings ***
Documentation  Basic example suite
Library  SeleniumLibrary


*** Test Cases ***
User must sign in to check out
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  ff
    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  Ferrari 458
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  results for "Ferrari 458"
    Click Link  css=#result_0 a.s-access-detail-page
    Wait Until Page Contains  Back to search results
    Click Button  id=add-to-cart-button
    # Click Link  id=buybox-see-all-buying-choices-announce
    # Wait Until Page Contains  Add to cart
    Sleep  5s
    Close Browser
