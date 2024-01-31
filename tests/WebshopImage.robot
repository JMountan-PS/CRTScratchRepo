*** Settings ***
Library           QWeb
Library           QImage
Suite Setup       OpenBrowser                 about:blank    chrome


*** Test Cases *** 
Test Sacha the Deer image
    GoTo          https://qentinelqi.github.io/shop/
    VerifyText    Find your spirit animal

    ${ActualImgPath}=    CaptureIcon    //*[@id\="products"]/section/div/ul/li[1]/div[1]/div[1]/a/img
    CompareImages        ${ActualImgPath}    SachaTheDeer.png    tolerance=0.9     #Changed this to a .png format