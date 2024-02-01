*** Settings ***
Resource                        ../resources/SalesforceCommon.robot
Suite Setup                     Setup Browser
Suite Teardown                  Close All Browser Sessions

*** Test Cases ***
Upload a File to Salesforce
    Set Library Search Order    QForce                      QWeb