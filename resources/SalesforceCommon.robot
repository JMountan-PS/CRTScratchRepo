*** Settings ***
Library                         QWeb
Library                         QForce
Library                         String
Library                         Collections


*** Keywords ***
Setup Browser
    Set Library Search Order    QWeb                        QForce
    Open Browser                about:blank                 ${browser}
    SetConfig                   LineBreak                   ${EMPTY}                    #\ue000
    SetConfig                   DefaultTimeout              30s                         #sometimes salesforce is slow


Close All Browser Sessions
    Close All Browsers


Login
    [Documentation]             Login to Salesforce instance
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}                 delay=1
    TypeText                    Password                    ${password}
    ClickText                   Log In
 


Login As
    [Documentation]       Login As different persona. User needs to be logged into Salesforce with Admin rights
    ...                   before calling this keyword to change persona.
    ...                   Example:
    ...                   LoginAs    Chatter Expert
    [Arguments]           ${persona}


    
    ClickText             Setup
    ClickText             Setup for current app
    SwitchWindow          NEW
    TypeText              Search Setup                ${persona}             delay=2
    ClickText             User                        anchor=${persona}      delay=3    # wait for list to populate, then click
    VerifyText            Freeze                      
    ClickText             Login                       anchor=Freeze          delay=1      

Home
    [Documentation]             Navigate to homepage, login if needed
    GoTo                        ${home_url}
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.                  2
    Run Keyword If              ${login_status}             Login                   
    ClickText                   Home
    VerifyTitle                 Home | Salesforce

Sales
    [Documentation]             Navigate to homepage, login if needed
    LaunchApp                   Sales
    VerifyText                  Sales