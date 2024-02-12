*** Settings ***
Library    RequestsLibrary
Library    DateTime
Library    String

*** Variables ***
${OAuth_Token}
${Active_Session}

*** Keywords ***
Authenticate Salesforce REST API
    [Arguments]    ${consumer_id}    ${consumer_secret}    ${username}    ${password}    ${url}=https://login.salesforce.com/

    # Create a session using Create Session
    ${Active_Session}=                     Create Session              SF_REST               ${url}services/

    # Populate body to be sent when calling API
    # Here we send an unix timestamp and timezone value
    &{body}=                    Create Dictionary           UnixTimeStamp=1987654321    Timezone=+3

    # Call a specific endpoint with body using Post On Session. Get response to a variable
    ${resp} =                   Post On Session             unixtimestamp               /fromunixtimestamp          json=&{body}
