*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Search For Product
    Input Text  id=twotabsearchtextbox  ${SEARCH_TERM}
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input

Verify Search Results Loaded
    Wait Until Page Contains  results for "${SEARCH_TERM}"
