*** Settings ***
Resource                        ../resources/SalesforceCommon.robot
Suite Setup                     Setup Browser
Suite Teardown                  Close All Browser Sessions

*** Variables ***
${AcctName}=    ${EMPTY}

*** Test Cases ***
Create Account Record data
    Home
    LaunchApp    Accounts
    
    ClickText    New
    

Upload a File to Salesforce
    Home
