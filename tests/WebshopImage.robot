*** Settings ***
Library           QWeb
Library           QImage
Library           QVision
Variables         ../data/Products_To_Verify.py
Suite Setup       OpenBrowser                 about:blank    chrome


*** Test Cases *** 
Test Sacha the Deer image
    Set Library Search Order            QWeb    QVision
    GoTo          https://qentinelqi.github.io/shop/
    VerifyText    Find your spirit animal

    QWeb.SetConfig     SearchMode                    none    #Remove highlighted border on captureIcon
    ${ActualImgPath}=    CaptureIcon    //*[@id\="products"]/section/div/ul/li[1]/div[1]/div[1]/a/img
    CompareImages        ${ActualImgPath}    SachaTheDeer.png    tolerance=0.95    #Changed this to a .png format
    QWeb.SetConfig     SearchMode                    draw        #Remove highlighted border on captureIcon

    