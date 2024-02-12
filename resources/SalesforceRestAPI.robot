*** Settings ***
Library    RequestsLibrary
Library    DateTime
Library    String

*** Variables ***
${OAuth_Token}

*** Keywords ***
Authenticate Salesforce REST API
    [Arguments]    ${consumer_id}    ${consumer_secret}    ${username}    ${password}    ${url}=https://login.salesforce.com/