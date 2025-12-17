# Automatically generated from Exploration demo (ID 41504) on Dec 17, 2025, 14:57:30 UTC. This is one time conversion.

# Generated from Exploration https://robotic.copado.com/explorations/41504/summary?projectId=46963&orgId=4644&view=details

*** Settings ***
Metadata    Organization Id    4644
Metadata    Project Id         46963
Metadata    Exploration Id     41504


# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***

Test case
    GoTo    https://www.copado.com/
    ClickText    Solutions
    VerifyText    Intelligent DevOps
    ClickText    See it in Action
    VerifyText    See pipelines in action
    # This window keeps popping up whil I'm trying to read the core page details. Address this with product team



    VerifyText    Boost quality fast with code quality gates and accelerated UAT