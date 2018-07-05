*** Settings ***
Documentation  Basic example suite
Library  SeleniumLibrary
Resource  ../resources/Common.robot
Resource  ../resources/po/LandingPage.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${SEARCH_TERM} =  Ferrari 458

*** Test Cases ***
User must sign in to check out
    [Tags]  Smoke
    Search for Products
    Select Product from Search Results
    Add Product to Cart
    Begin Checkout
    Sleep  3s

*** Keywords ***
Search for Products
    LandingPage.Load
    LandingPage.Verify Page Loaded
    # Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  ${SEARCH_TERM}
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  results for "${SEARCH_TERM}"

Select Product from Search Results
    Click Link  css=#result_0 a.s-access-detail-page
    Wait Until Page Contains  Back to search results

Add Product to Cart
    Click Button  id=add-to-cart-button
    Wait Until Page Contains  Added to Cart

Begin Checkout
    Click Link  Proceed to checkout (1 item)
    # Page Should Contain Element  ap_signin1a_pagelet_title
    # Element Text Should Be  ap_signin1a_pagelet_title  SIgn In
