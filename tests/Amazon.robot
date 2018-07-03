*** Settings ***
Documentation  Basic example suite
Library  SeleniumLibrary


*** Test Cases ***
User must sign in to check out
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  ff
    Sleep  5s
    Close Browser
