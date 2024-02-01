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
    ClickText       Save                      partial_match=False

Upload a File to Salesforce Using QVision
    ClickText    Show All
    ClickText    Files    
    ClickText    Add Files    
    ClickText    Upload Files
    
    #Now we need to swap to QVision in order to click through the Linux filesystem
    QVision.ClickText    suite    anchor=services
    QVision.DoubleClick           data
    QVision.DoubleClick           UploadStaging
    QVision.DoubleClick           Lorem_ipsum.pdf
    
    #Now that the file is uploaded, we can go back to QWeb
    ClickText                     Done
    VerifyText                    file was added to the Account
    
Verify information in a PDF
    ClickText                Lorem_ipsum    anchor=Title
    
    #Again we need to use QVision in most PDF validation use cases
    QVision.VerifyText       Lorem Ipsum is simply dummy text of the printing
    ...                      and typesetting industry.
    QVision.VerifyText       Test PDF
    
