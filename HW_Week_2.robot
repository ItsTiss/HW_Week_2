***Settings***
Library         SeleniumLibrary
Library         DataDriver  file=C:/Users/Tis Doppio/Archive/DRF-101/HW_Week_2/HW2_TestData.csv     dialect=excel
Test Setup      Open "Jenkins" Website
Test Teardown   Close Browser
Test Template   Login Scenarios

***Variables***
${Browser}      chrome
${URL}          http://www.doppio-tech.com:8080/login

***Keywords***
Open "Jenkins" Website
    Open Browser     ${URL}     ${Browser}
    Maximize Browser Window

Login Scenarios
    [Arguments]     ${username}     ${password}     ${verify_msg_locator}     ${verify_msg}
    Input Text                          xpath=//*[@id="j_username"]                     ${username}
    Input Text                          xpath=/html/body/div/div/form/div[2]/input      ${password}
    Click Element                       xpath=/html/body/div/div/form/div[3]/input
    Wait Until Page Contains Element    ${verify_msg_locator}     
    Element Should Contain              ${verify_msg_locator}                           ${verify_msg}

***Test Cases***
Login to "Jenkins" Website