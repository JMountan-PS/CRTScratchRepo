*** Settings ***
Library           QWeb
Library           QImage
Suite Setup       OpenBrowser                 about:blank    chrome


*** Test Cases *** 
Test Sacha the Deer image
    GoTo          https://qentinelqi.github.io/shop/
    VerifyText    Find your spirit animal