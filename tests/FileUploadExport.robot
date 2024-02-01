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
    ${AcctName}=    Generate Random String    length=10    chars=[LETTERS]
    TypeText        *Account Name             ${AcctName}
    
    

Upload a File to Salesforce
    Home
