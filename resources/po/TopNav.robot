*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${TOPNAV_SEARCH_TEXT_INPUT} =  id=twotabsearchtextbox
${TOPNAV_SEARCH_BUTTON} =  xpath=//*[@id="nav-search"]/form/div[2]/div/input

*** Keywords ***
Search For Product
    Input Text  ${TOPNAV_SEARCH_TEXT_INPUT}  ${SEARCH_TERM}
    Click Button  ${TOPNAV_SEARCH_BUTTON}

Verify Search Results Loaded
    Wait Until Page Contains  results for "${SEARCH_TERM}"
