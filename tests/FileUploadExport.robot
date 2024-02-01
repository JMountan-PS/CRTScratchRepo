*** Settings ***
Resource                   ../resources/SalesforceCommon.robot
Suite Setup                Setup Browser
Suite Teardown             Close All Browser Sessions

*** Variables ***
${AcctName}=               ${EMPTY}

*** Test Cases ***
Create Account Record data
    Home
    LaunchApp              Accounts

    ClickText              New
    ${AcctName}=           Generate Random String      length=10                   chars=[LETTERS]
    TypeText               *Account Name               ${AcctName}
    ClickText              Save                        partial_match=False

Upload a File to Salesforce Using QVision
    ClickText              Show All
    ClickText              Files
    ClickText              Add Files
    ClickText              Upload Files

    #Now we need to swap to QVision in order to click through the Linux filesystem
    QVision.DoubleClick    suite                       anchor=ui-recorder
    QVision.DoubleClick    data
    QVision.DoubleClick    UploadStaging
    QVision.DoubleClick    CRT Training Day 1.pdf

    #Now that the file is uploaded, we can go back to QWeb
    ClickText              Done
    VerifyText             file was added to the Account

Verify information in a PDF
    ClickText              CRT Training Day 1          anchor=Title
    Sleep                  10s

    #Again we need to use QVision in most PDF validation use cases
    QVision.VerifyText     Theory & Practice           timeout=40s
    QVision.VerifyText     Section 1
    QVision.HotKey         pagedown
    QVision.VerifyText     Introduction to Testing
    QVision.VerifyText     Test Automation
    QVision.VerifyText     Principles                  anchor=Test Automation


    #When we're done, use Hotkey to escape the window
    QVision.HotKey         esc

Download the same PDF

    UseTable               Title
    ClickCell              r?CRT Training Day 1/c6
    ExpectFileDownload
    ClickText              Download
    VerifyFileDownload

    #Try using QVision to quickly click the downloaded file name
    QVision.ClickText      CRT Training Day 1.pdf

    #Need to switch tabs now that we have opened the pdf
    SwitchWindow           NEW

    #Again we need to use QVision in most PDF validation use cases
    QVision.VerifyText     Theory & Practice           timeout=40s
    QVision.VerifyText     Section 1
    QVision.ClickText      Section 1                   #Sometimes we need to click into elements when using QVision

    #Switch back once done
    CloseWindow
    SwitchWindow           1

Export download to Git

    #Trying to figure out where the downloads folder is in relation to this files Current directory
    Log Variables          level=WARN                  #Find the value for ${CURDIR}
    List Directory         /home                       #Start searching for Downloads folder from /home
    List Directory         /home/services
    List Directory         /home/services/Downloads    #Found it
    List Directory         ${CURDIR}/../../            #Figuring out the same filepath from the current directory

    Copy File              ${CURDIR}/../../Downloads/CRT Training Day 1.pdf        ${CURDIR}/../data/DownloadStaging
    File Should Exist      ${CURDIR}/../data/DownloadStaging/CRT Training Day 1.pdf                      #Confirm the file is copied
    
    #Leverage the GitOperations library to commit the file to github
    Commit And Push        ${CURDIR}/../data/DownloadStaging/CRT Training Day 1.pdf       main               