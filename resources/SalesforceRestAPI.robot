*** Settings ***
Library    RequestsLibrary
Library    DateTime
Library    String

*** Variables ***
${OAuth_Token}
${Active_Session}

*** Test Cases ***
Test this out
    Authenticate Salesforce REST API    3MVG9Rr0EZ2YOVMYqYQJc2MIJgxXxFL_UsqLZEJ0myKQ_j5pqZo9cpWSMTnIcxCcG519gVdCU_itscZ4WgE26    
    ...                                 ${consumer_secret}  
    ...                                 c1-jmountan@copado.com       
    ...                                 ${password}

*** Keywords ***
Authenticate Salesforce REST API
    [Arguments]    ${client_id}    ${client_secret}    ${username}    ${password}    ${url}=https://login.salesforce.com/

    ${Active_Session}=          Create Session              SF_REST               https://login.salesforce.com/services
    &{body}=                    Create Dictionary           grant_type=password
    ...                                                     client_id=${client_id}
    ...                                                     client_secret=${client_secret}
    ...                                                     username=${username}
    ...                                                     password=${password}

    ${resp} =                   Post On Session             SF_REST               /oauth2/token          json=&{body}
