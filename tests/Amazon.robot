*** Settings ***
Documentation  Basic example suite
Library  SeleniumLibrary
Resource  ../resources/Common.robot
Resource  ../resources/po/LandingPage.robot
Resource  ../resources/po/TopNav.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${SEARCH_TERM} =  Lamborghini

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
    TopNav.Search For Product
    TopNav.Verify Search Results Loaded

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
