# Automatically generated from Exploration google (ID 46207) on Dec 17, 2025, 19:12:43 UTC. This is one time conversion.

# Generated from Exploration https://robotic.copado.com/explorations/46207/summary?projectId=46963&orgId=4644&view=details

*** Settings ***
Metadata    Organization Id    4644
Metadata    Project Id         46963
Metadata    Exploration Id     46207


# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***

Test case
    GoTo    https://www.google.com/
    ClickText    About
    ClickText    Products
    ClickText    See what’s new