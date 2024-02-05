*** Settings ***

Documentation                New test suite
Library                      QWeb
Library                      String
Library                      DateTime
Suite Setup                  Open Browser                about:blank                 chrome
Suite Teardown               Close All Browsers

*** Test Cases ***
Figure out Time Elapsed

    ${DateCreated}=          Get Current Date            result_format=%-m/%-d/%Y %-H:%-M
    ${DateAccessed}=         Get Current Date            result_format=%-m/%-d/%Y %-H:%-M                    increment=140m

    #Date format options include
    #1:User defined: https://strftime.org/               https://robotframework.org/robotframework/latest/libraries/DateTime.html#Custom%20timestamp
    #2:'epoch': https://robotframework.org/robotframework/latest/libraries/DateTime.html#Epoch%20time
    #3:'datetime': https://robotframework.org/robotframework/latest/libraries/DateTime.html#Python%20datetime
    #4:'timestamp': https://robotframework.org/robotframework/latest/libraries/DateTime.html#Timestamp
    ${DateCreatedEpoch}=     Convert Date                ${DateCreated}              result_format=epoch     date_format=%m/%d/%Y %H:%M
    ${DateAccessedEpoch}=    Convert Date                ${DateAccessed}             result_format=epoch     date_format=%m/%d/%Y %H:%M
    ${Elapsed}=              Subtract Date From Date     ${DateAccessedEpoch}        ${DateCreatedEpoch}

    #Time format options include
    #1:'number' (pure number in seconds)
    #2:'compact' (shortened human-readable)
    #3:'verbose' (long human-readable)
    #4:'timer' (Hour:Minute:Second.Milisecond timer format)
    #See this url for more: https://robotframework.org/robotframework/latest/libraries/DateTime.html#Time%20formats
    ${Elapsed}=              Convert Time                ${Elapsed}                  result_format=number

    #How to conditionally branch based on number format
    IF                       ${Elapsed} < 1200           #If less than 20 minutes passed
        Log To Console       Green Status
    ELSE IF                  ${Elapsed} < 2400           #If less than 40 minutes passed
        Log To Console       Yellow Status
    ELSE IF                  ${Elapsed} < 3600           #If less than 60 minutes passed
        Log To Console       Red Status
    ELSE                     #If more than 60 minutes passed
        Log To Console       Critical Status
    END

    #How to conditionally branch based on timer format
    ${Elapsed}=              Convert Time                ${Elapsed}                  result_format=timer

    #Split into Hours/Minutes
    ${SplitTimer}=           Split String                ${Elapsed}                  :
    ${HoursElapsed}=         Convert To Number           ${SplitTimer}[0]
    ${MinutesElapsed}=       Convert To Number           ${SplitTimer}[1]
    ${HoursElapsedInMin}=    Evaluate                    ${HoursElapsed} * 60
    ${MinutesElapsedTotal}=                        Evaluate                        ${MinutesElapsed} + ${HoursElapsedInMin}

    IF                       ${MinutesElapsedTotal} < 20           #If less than 20 minutes passed
        Log To Console       Green Status
    ELSE IF                  ${MinutesElapsedTotal} < 40           #If less than 40 minutes passed
        Log To Console       Yellow Status
    ELSE IF                  ${MinutesElapsedTotal} < 60           #If less than 60 minutes passed
        Log To Console       Red Status
    ELSE                     #If more than 60 minutes passed
        Log To Console       Critical Status
    END